//
//  LoginPage.swift
//  Kooking
//
//  Created by Kayky Belleboni Casagrande on 28/07/22.
//

import SwiftUI
import GoogleSignInSwift

struct LoginPage: View {
    @EnvironmentObject var auth: AuthenticationViewModel
    
    var body: some View {
        GoogleSignInButton {
            auth.signIn()
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
