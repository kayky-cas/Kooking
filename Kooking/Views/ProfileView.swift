//
//  ProfileView.swift
//  Kooking
//
//  Created by Kayky Belleboni Casagrande on 28/07/22.
//

import SwiftUI
import GoogleSignIn

struct ProfileView: View {
    var user: User?
    
    var body: some View {
        if (user != nil) {
            VStack {
                Text(user!.name)
                
                Text("My ingredients")
                List {
                    ForEach(0..<user!.ingredients.count, id: \.self) {
                        i in
                        IngredientUnitView(ingredient: user!.ingredients[i])
                    }
                }.toolbar {
                    EditButton()
                }
            }
        }
        
        else {
            Text("You are not logged!")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(id: "", name: "Kayky", ingredients: [
            Ingredient(id: 1, name: "Apple", amount: 2, unit: "oz"),
            Ingredient(id: 1, name: "Apple", amount: 2, unit: "oz"),
            Ingredient(id: 1, name: "Apple", amount: 2, unit: "oz"),
            Ingredient(id: 1, name: "Apple", amount: 2, unit: "oz")
        ])
        ProfileView(user: user)
    }
}
