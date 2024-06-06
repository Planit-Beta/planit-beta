//
//  DBViewModel.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/04/21.
//

import SwiftUI
import FirebaseFirestore
import FirebaseStorage

class FirestoreViewModel: ObservableObject {
    static let shared = FirestoreViewModel()

    private var db = Firestore.firestore()
    
    @Published var user: User = User(id: "", name: "", email: "", gender: "男", age: 0, image: "", plans: [])
    
    @Published var users: [User] = []
    
    @Published var plans: [Plan] = []
    
    @Published var plansArray: [[SpotInfo]] = []
    
    @Published var selectedImage: [Data] = []
    @Published var inputUserName: String = ""
    @Published var inputAge: Int = 0
    @Published var inputGender: String = ""
    

    func saveUser(completion: @escaping (Error?) -> Void) {
        let docRef = db.collection("users").document(user.id)
        
        let user = User(id: user.id, name: user.name, email: user.email, gender: user.gender, age: user.age, image: user.image, plans: user.plans)
        
        docRef.setData([
            "id": user.id,
            "name": user.name,
            "email": user.email,
            "gender": user.gender,
            "age": user.age,
            "image": user.image,
            "plans": user.plans
        ]) { error in
            completion(error)
        }
    }
    
    func fetchUsers(user_id: String) {
        db.collection("users").whereField("id", isEqualTo: user_id).getDocuments { snapshot, error in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                self.users = snapshot?.documents.map {
                    User(id: $0.data()["id"] as? String ?? "",
                         name: $0.data()["name"] as? String ?? "",
                         email: $0.data()["email"] as? String ?? "",
                         gender: $0.data()["gender"] as? String ?? "",
                         age: $0.data()["age"] as? Int ?? 0,
                         image: $0.data()["image"] as? String ?? "",
                         plans: $0.data()["plans"] as? [[SpotInfo]] ?? []
                    )
                } ?? []
            }
        }
    }
    
    
    func AddPlan(user_id: String, date: String, plan: [SpotInfo], completion: @escaping (Error?) -> Void) {
        let docRef = db.collection("plans").document()
        
        let plan = Plan(id: docRef.documentID, uid: user_id, date: date, plan: plan)
        
        docRef.setData([
            "id": plan.id,
            "uid": plan.uid,
            "date": plan.date,
            "spots": plan.plan.map { $0.toDictionary() }
        ]) { error in
            completion(error)
        }
    }
    
    func fetchPlans(user_id: String) {
        db.collection("plans")
            .whereField("uid", isEqualTo: user_id)
            .getDocuments { snapshot, error in
                if let error = error {
                    print("Error getting documents: \(error)")
                } else {
                    print("Fetched plans successfully for user: \(user_id)")
                    let decoder = JSONDecoder()
                    self.plans = snapshot?.documents.compactMap { document -> Plan? in
                        let id = document.data()["id"] as? String ?? ""
                        let uid = document.data()["uid"] as? String ?? ""
                        let date = document.data()["date"] as? String ?? ""
                        if let spotsData = document.data()["spots"] as? [[String: Any]] {
                            let spots = spotsData.compactMap { spotDict -> SpotInfo? in
                                do {
                                    let jsonData = try JSONSerialization.data(withJSONObject: spotDict)
                                    return try decoder.decode(SpotInfo.self, from: jsonData)
                                } catch {
                                    print("Decoding error for spot: \(error)")
                                    return nil
                                }
                            }
                            self.plansArray.append(spots)
                            print(self.plansArray)
                            return Plan(id: id, uid: uid, date: date, plan: spots)
                        }
                        return nil
                    } ?? []
                    if !self.plans.isEmpty {
                        print("First plan spots: \(self.plans[0].plan)")
                    }
                }
        }
    }

    
    func EditProfile(user_id: String, completion: @escaping (Error?) -> Void) {
        
        let docRef = db.collection("users").document(user_id)
        
        let name = self.inputUserName
        let age = self.inputAge
        let gender = self.inputGender
        
        docRef.updateData([
            "name": name,
            "age": age,
            "gender": gender,
        ]) { error in
            completion(error)
        }
    }
    
    func EditImage(user_id: String, completion: @escaping (Error?) -> Void) {
        
        let docRef = db.collection("users").document(user_id)
        
        let image = user.image
        
        docRef.updateData([
            "image": image,
        ]) { error in
            completion(error)
        }
    }

    func AddImage(completion: @escaping () -> Void){
        let storageref = Storage.storage().reference(forURL: "gs://planit-beta-31b65.appspot.com")
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"

        let ref = storageref.child("users/\(Date().timeIntervalSince1970).jpg")
        ref.putData(self.selectedImage[0] as Data, metadata: metadata) { (metadata, error) in
            if let _ = metadata {
                // ②storageへの保存が成功した場合はdownloadURLの取得を行う
                ref.downloadURL{(url,error) in
                    if let downloadUrl = url {
                        let downloadUrlStr = downloadUrl.absoluteString
                        self.user.image = downloadUrlStr
                        print(downloadUrlStr)
                    } else {
                        return
                    }
                }
            }
            
            if error != nil {
                return
            }
        }
        
        completion()
    }

}

