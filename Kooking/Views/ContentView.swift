//
//  ContentView.swift
//  Kooking
//
//  Created by Kayky Belleboni Casagrande on 26/07/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var auth: AuthenticationViewModel
    
    var body: some View {
        TabNavigationView()
//        if (auth.state == .signedIn) {
//            TabNavigationView()
//        } else {
//            LoginPage()
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(RecipesViewModel())
            .environmentObject(AuthenticationViewModel())
    }
}
