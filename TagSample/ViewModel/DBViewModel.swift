//
//  DBViewModel.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/04/21.
//

import SwiftUI
import FirebaseFirestore
import FirebaseStorage

class DBViewModel: ObservableObject {
    private var db = Firestore.firestore()
    
    @Published var user: User = User(id: "", name: "", email: "", gender: "", age: "", image: "", plans: [])
    
    @Published var users: [User] = []
    
    @Published var plan: [SpotInfo] = []
    
    @Published var plans: [[SpotInfo]] = []
    
    @Published var selectedImage: [Data] = []
    
    @EnvironmentObject var viewModel: ViewModel
    

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
                         age: $0.data()["age"] as? String ?? "",
                         image: $0.data()["image"] as? String ?? "",
                         plans: $0.data()["plans"] as? [[SpotInfo]] ?? []
                    )
                } ?? []
            }
        }
    }
    
    
    func AddPlan(user_id: String, completion: @escaping (Error?) -> Void) {
        let docRef = db.collection("users").document(user_id)
        
        let plan = viewModel.SpotInfos
        
        docRef.updateData([
            "plans": user.plans.append(plan),
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

