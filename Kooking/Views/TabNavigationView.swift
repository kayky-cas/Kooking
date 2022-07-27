//
//  TabNavigationView.swift
//  Kooking
//
//  Created by Kayky Belleboni Casagrande on 27/07/22.
//

import SwiftUI

struct TabNavigationView: View {
    @EnvironmentObject var recipes: RecipesViewModel
    
    var body: some View {
        TabView {
            NavigationView {
                
                RecipesListView(recipes: recipes.recipes)
                    .navigationTitle("Recipes")
            }.tabItem {
                Image(systemName: "book")
                Text("Recipes")
            }
            
            NavigationView {
                Text("Ingredients")
                    .navigationTitle("Ingredients")
                
            }.tabItem {
                Image(systemName: "takeoutbag.and.cup.and.straw")
                Text("Ingredients")
            }
            
            NavigationView {
                Text("Profile")
                    .navigationTitle("Profile")
            }.tabItem {
                Image(systemName: "person")
                Text("My profile")
            }
        }.onAppear {
            recipes.getRecipes()
        }
    }
}

struct TabNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigationView()
            .environmentObject(RecipesViewModel())
    }
}
