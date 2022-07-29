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
                
//                GoogleSignInButton {
//                    auth.signIn()
//                }
//                .frame(width: 150)
//                .aspectRatio(contentMode: .fit)
//                .padding()
                
                Button {
                    auth.signIn()
                } label: {
                    HStack {
                        Image("google-icon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Spacer()
                        Text("Sign in with google")
                    }.padding(.horizontal)
                }.buttonStyle(.plain).frame(width: 250, height: 50)
                    .aspectRatio(contentMode: .fit)
                    .background(Color.white)
                    .clipShape(Capsule())
                    .shadow(radius: 5, y: 6)
                    .padding(.top, 30)
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
