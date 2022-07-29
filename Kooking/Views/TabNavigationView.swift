//
//  TabNavigationView.swift
//  Kooking
//
//  Created by Kayky Belleboni Casagrande on 27/07/22.
//

import SwiftUI

struct TabNavigationView: View {
    @EnvironmentObject var recipes: RecipesViewModel
    @EnvironmentObject var auth: AuthenticationViewModel
    
    @State var myRecipes = false
    
    var ingredients = [
        Ingredient(id: 0, name: "Apple", amount: 20, unit: ""),
        Ingredient(id: 0, name: "Apple", amount: 20, unit: ""),
        Ingredient(id: 0, name: "Apple", amount: 20, unit: ""),
        Ingredient(id: 0, name: "Apple", amount: 20, unit: "")


    ]

    var body: some View {
        TabView {
            NavigationView {
                
                VStack {
                    Picker("Recipe Type", selection: $myRecipes) {
                        Text("All").tag(false)
                        Text("With my ingredients").tag(true)
                    }.pickerStyle(.segmented)
                    RecipesListView(recipes: myRecipes ? recipes.myRecipes : recipes.recipes)
                        .navigationTitle("Recipes")
                }
            }.tabItem {
                Image(systemName: "book")
                Text("Recipes")
            }
            
            NavigationView {
                IngredientsView(ingredients: recipes.allIngredients)
                    .navigationTitle("Ingredients")
                
            }.tabItem {
                Image(systemName: "takeoutbag.and.cup.and.straw")
                Text("Ingredients")
            }
            
            NavigationView {
                ProfileView(user: auth.currentUser)
                    .navigationTitle("Profile")
            }.tabItem {
                Image(systemName: "person")
                Text("My profile")
            }
        }.onAppear {
            recipes.getRecipes()
            recipes.getIngredients()
        }
    }
}

struct TabNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigationView()
            .environmentObject(RecipesViewModel())
            .environmentObject(AuthenticationViewModel())
    }
}
