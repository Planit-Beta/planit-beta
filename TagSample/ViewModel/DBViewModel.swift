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
    
    @Published var selectedImages: [Data] = []
    
    @EnvironmentObject var viewModel: ViewModel
    

    func saveUser(completion: @escaping (Error?) -> Void) {
        let docRef = db.collection("users").document()
        
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
    
    
    func AddPlan(completion: @escaping (Error?) -> Void) {
        let docRef = db.collection("plans").document()
        
        let plan = viewModel.SpotInfos
        
        docRef.updateData([
            "plans": plan,
        ]) { error in
            completion(error)
        }
    }

//    func fetchPosts(user_email: String) {
//        db.collection("plans")
//            .whereField("members_sns", arrayContains: user_email).getDocuments { snapshot, error in
//            if let error = error {
//                print("Error getting documents: \(error)")
//            } else {
//                print("done")
//                self.plans = snapshot?.documents.map{
//                    plans =
//                } ?? []
//            }
//        }
//    }

}

