//
//  AuthView.swift
//  SwiftfulThinking-FirebaseBootcamp
//
//  Created by RainBowT on 2024/7/18.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import AuthenticationServices
import CryptoKit




@MainActor
final class AuthViewModel:ObservableObject{
    
    let signInApplerHelper = SignInAppleHelper()
    
    func signInGoogle() async throws{
        let helper = SignInGoogleHelper()
        let tokens = try await helper.signIn()
        try await AuthManager.shared.signInWithGoogle(tokens: tokens)
    }
    
    func signInApple() async throws{
        let helper = SignInAppleHelper()
        let tokens = try await helper.startSignInWithAppleFlow()
        print("Sign In Apple Tokens: \(tokens)")
        try await AuthManager.shared.signInWithApple(tokens: tokens)
    }
    
}

struct AuthView: View {
    
    @StateObject private var viewModel = AuthViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        VStack{
            NavigationLink{
                SignInEmailView(showSignInView: $showSignInView)
            } label:{
                Text("Sign In With Email")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme:.dark,style: .wide,state:.normal)){
                Task{
                    do{
                        try await viewModel.signInGoogle()
                        showSignInView = false
                    }catch{
                        print(error)
                    }
                }
            }
            
            Button(action:{
                Task{
                    do{
                        print("Sign in with Apple ......")
                        try await viewModel.signInApple()
                        showSignInView = false
                        print("Sign in with Apple Successrd")
                    }catch{
                        print(error)
                    }
                }
            },label: {
                SignInWithAppleButtonViewRepresentable(type: .default, style: .black)
                    .allowsHitTesting(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
            })
            .frame(height: 55)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Sign In")
    }
}

#Preview {
    NavigationStack{
        AuthView(showSignInView: .constant(false))
    }
}
