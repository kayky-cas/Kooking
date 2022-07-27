//
//  KookingApp.swift
//  Kooking
//
//  Created by Kayky Belleboni Casagrande on 26/07/22.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn

@main
struct KookingApp: App {
    @StateObject var auth = Authentication()
        
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(auth)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        
        FirebaseApp.configure()

        return true
    }
    
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any]) -> Bool {
      return GIDSignIn.sharedInstance.handle(url)
    }
}
