//
//  KookingApp.swift
//  Kooking
//
//  Created by Kayky Belleboni Casagrande on 26/07/22.
//

import SwiftUI
import FirebaseCore

@main
struct KookingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        
        FirebaseApp.configure()

        return true
      }
}
