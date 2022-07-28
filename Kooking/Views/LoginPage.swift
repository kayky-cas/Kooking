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
        
        VStack {
            Image("kook-sem-fundo")
                .padding()
            
            VStack (spacing: 5){
                Text("KOOKING")
                    .font(.title)
                    .bold()
                Text("Welcome to the number one recipe consulting app")
                    .frame(width: 200, height: 50)
                    .lineLimit(nil)
                    .font(.callout)
                    .multilineTextAlignment(.center)
                
                GoogleSignInButton {
                    auth.signIn()
                }
                .frame(width: 150)
                .aspectRatio(contentMode: .fit)
                .padding()
            }
            Spacer()
        }
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
    }
}
