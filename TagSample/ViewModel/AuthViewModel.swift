//
//  AuthViewModel.swift
//  TagSample
//
//  Created by 濱野遥斗 on 2024/04/20.
//


import SwiftUI
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var isAuthenticated = false
    
    @Published var isShowPostPage = false
    @Published var isMoveToRegisterInfo = false
    @Published var isCorrectRegisterInfo = false
    @Published var isNewUser = false
    
    // イニシャライザメソッドを呼び出して、アプリの起動時に認証状態をチェックする
    init() {
        observeAuthChanges()
    }

    private func observeAuthChanges() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                if (self?.isNewUser == true) {
                    self?.isAuthenticated = user != nil && self?.isCorrectRegisterInfo == true
                } else {
                    self?.isAuthenticated = user != nil
                }
            }
        }
    }
    
    // ログインするメソッド
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            DispatchQueue.main.async {
                if result != nil, error == nil {
                    self?.isAuthenticated = true
                }
            }
        }
    }
    
    // 新規登録するメソッド
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            DispatchQueue.main.async {
                if result != nil, error == nil {
                    self?.isMoveToRegisterInfo = true
                } else {
                    self?.isNewUser = false
                }
            }
        }
    }
    
    // パスワードをリセットするメソッド
    func resetPassword(email: String) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            if let error = error {
                print("Error in sending password reset: \(error)")
            }
        }
    }
    
    // ログアウトするメソッド
    func signOut() {
        do {
            try Auth.auth().signOut()
            isAuthenticated = false
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
    
    func getUserID() -> String{
        return Auth.auth().currentUser?.uid ?? "!!!"
    }
    
    func getEmail() -> String{
        return Auth.auth().currentUser?.email ?? "!!!"
    }
}
