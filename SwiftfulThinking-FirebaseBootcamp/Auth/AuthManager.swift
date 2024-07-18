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
    
    func createUser(email: String, password: String) async throws -> AuthResult{
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthResult(user: result.user)
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
}
