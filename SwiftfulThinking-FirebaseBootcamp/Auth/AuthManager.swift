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

enum AuthProviderOption: String{
    case email = "password"
    case google = "google.com"
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
    
    //  google.com
    //  password
    func getProviders() throws -> [AuthProviderOption]{
        guard let providerData = Auth.auth().currentUser?.providerData else{
            throw URLError(.badServerResponse)
        }
        
        var providers: [AuthProviderOption] = []
        for provider in providerData{
            if let option = AuthProviderOption(rawValue:provider.providerID){
                providers.append(option)
            }else{
                assertionFailure("Provider option not found: \(provider.providerID)")
            }
        }
        
        return providers
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
}

//  MARK: SIGN IN EMAIL
extension AuthManager{
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
}

//  MARK: SIGN IN SSO
extension AuthManager{
    
    @discardableResult
    func signInWithGoogle(tokens:GoogleSignResultModel) async throws-> AuthResult{
        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.accessToken)
        return try await signIn(credential: credential)
    }
    
    func signIn(credential: AuthCredential) async throws-> AuthResult{
        let result = try await Auth.auth().signIn(with: credential)
        return AuthResult(user: result.user)
    }
}
