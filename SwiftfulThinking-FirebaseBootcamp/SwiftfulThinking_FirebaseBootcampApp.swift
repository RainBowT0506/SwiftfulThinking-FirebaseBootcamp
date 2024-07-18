//
//  SwiftfulThinking_FirebaseBootcampApp.swift
//  SwiftfulThinking-FirebaseBootcamp
//
//  Created by RainBowT on 2024/7/18.
//

import SwiftUI
import Firebase

@main
struct SwiftfulThinking_FirebaseBootcampApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    print("FirebaseApp Configure")
    return true
  }
}
