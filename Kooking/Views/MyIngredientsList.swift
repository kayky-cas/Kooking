//
//  MyIngredientsList.swift
//  Kooking
//
//  Created by Kayky Belleboni Casagrande on 28/07/22.
//

import SwiftUI

struct MyIngredientsList: View {
    @EnvironmentObject var auth: AuthenticationViewModel
    @EnvironmentObject var recipes: RecipesViewModel
    
    var body: some View {
        if auth.currentUser == nil {
            Text("User not logged!")
        }
        
        else {
            List {
                ForEach(auth.currentUser!.ingredients, id: \.self) {
                    ingredient in
                    IngredientUnitView(ingredient: ingredient)
                }.onDelete { auth.currentUser!.ingredients.remove(atOffsets: $0)
                    recipes.getRecipesByIngredients(ingredients: auth.currentUser!.ingredients)
                }
                .onMove { auth.currentUser!.ingredients.move(fromOffsets: $0, toOffset: $1)
                }
            }
            .toolbar {
                EditButton()
            }
        }
    }
}

struct MyIngredientsList_Previews: PreviewProvider {
    static var previews: some View {
        MyIngredientsList()
    }
}
