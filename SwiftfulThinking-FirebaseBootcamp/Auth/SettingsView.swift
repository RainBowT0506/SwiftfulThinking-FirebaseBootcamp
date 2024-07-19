//
//  SettingsView.swift
//  SwiftfulThinking-FirebaseBootcamp
//
//  Created by RainBowT on 2024/7/18.
//

import SwiftUI


@MainActor
final class SettingsViewModel: ObservableObject{
    
    @Published var authProviders: [AuthProviderOption] = []
    
    func loadAuthProviders(){
        if let providers = try? AuthManager.shared.getProviders(){
            authProviders = providers
        }
    }
    
    func signOut() throws{
        try AuthManager.shared.signOut()
    }
    
    func resetPassword() async throws {
        let authUser = try AuthManager.shared.getAuthUser()
        
        guard let email = authUser.email else{
            throw URLError(.fileDoesNotExist)
        }
        
        try await AuthManager.shared.resetPassword(email: email)
    }
    
    func updatePassword() async throws{
        let password = "123456"
        try await AuthManager.shared.updatePassword(password: password)
    }
    
    func updateEmail() async throws{
        let email = "Test@gmail.com"
        try await AuthManager.shared.updateEmail(email: email)
    }
}

struct SettingsView: View {
    
    @StateObject private var viewModel = SettingsViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        List{
            Button("Log out"){
                Task{
                    do{
                        try viewModel.signOut()
                        showSignInView = true
                    }catch{
                        print(error)
                    }
                }
            }
            
            if viewModel.authProviders.contains(.email){
                emailSection
            }
            
        }
        .onAppear{
            viewModel.loadAuthProviders()
        }
        .navigationBarTitle("Settings")
    }
}

extension SettingsView{
    private var emailSection: some View{
        Section{
            Button("Reset password"){
                Task{
                    do{
                        try await viewModel.resetPassword()
                        print("Reset Password")
                    }catch{
                        print(error)
                    }
                }
            }
            
            Button("Update password"){
                Task{
                    do{
                        try await viewModel.updatePassword()
                        print("Update Password")
                    }catch{
                        print(error)
                    }
                }
            }
            
            Button("Update email"){
                Task{
                    do{
                        try await viewModel.updateEmail()
                        print("Update Email")
                    }catch{
                        print(error)
                    }
                }
            }
        } header: {
            Text("Email function")
        }
    }
}

#Preview {
    NavigationStack{
        SettingsView(showSignInView: .constant(false))
    }
}
