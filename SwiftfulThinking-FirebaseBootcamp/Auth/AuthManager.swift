//
//  AuthManager.swift
//  SwiftfulThinking-FirebaseBootcamp
//
//  Created by RainBowT on 2024/7/18.
//

import Foundation
import FirebaseAuth

struct AuthResult{
    let uid: String
    let email: String?
    let photoUrl: String?
    
    init(user: User){
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}

final class AuthManager{
    static let shared = AuthManager()
    private init(){
        
    }
    
    func getAuthUser() throws -> AuthResult{
        guard let user = Auth.auth().currentUser else{
            throw URLError(.badServerResponse)
        }
        
        return AuthResult(user: user)
    }
    
    @discardableResult
    func createUser(email: String, password: String) async throws -> AuthResult{
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthResult(user: result.user)
    }
    
    @discardableResult
    func signInUser(email: String, password: String) async throws -> AuthResult{
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthResult(user: result.user)
    }
    
    func resetPassword(email: String) async throws{
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    func updatePassword(password: String)async throws{
        guard let user = Auth.auth().currentUser else{
            throw URLError(.badServerResponse)
        }
        
        try await user.updatePassword(to: password)
    }
    
    func updateEmail(email: String) async throws{
        guard let user = Auth.auth().currentUser else{
            throw URLError(.badServerResponse)
        }
        
        try await user.updateEmail(to: email)
    }
    
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
}
