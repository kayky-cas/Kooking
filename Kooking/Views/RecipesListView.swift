//
//  RecipesListView.swift
//  Kooking
//
//  Created by Kayky Belleboni Casagrande on 27/07/22.
//

import SwiftUI

struct RecipesListView: View {
    @State private var showRecipeSheet = false
    @State private var actualRecipe: Recipe?
    var recipes = [Recipe]()
    
    var body: some View {
        List {
            ForEach(0..<recipes.count, id: \.self) { i in
                Button {
                    showRecipeSheet.toggle()
                    actualRecipe = recipes[i]
                } label: {
                    RecipeUnitView(recipe: recipes[i])
                        .frame(height: 80)
                }
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
        }.listStyle(PlainListStyle())
        .sheet(isPresented: $showRecipeSheet) {
            RecipeSheet(recipe: $actualRecipe)
        }
            
    }
}

struct RecipesListView_Previews: PreviewProvider {
    static var previews: some View {
        let recipes = [
            Recipe(id: 658725, image: "https://spoonacular.com/recipeImages/658725-556x370.jpg", title: "Rocky Road Ice Cream", readyInMinutes: 45, sourceUrl: "https://www.foodista.com/recipe/WGM3YMVS/rocky-road-ice-cream", usedIngredients: [], missedIngredients: nil, ingredients: [
                    Ingredient(id: 0, name: "brie", amount: 5, unit: "oz"),
                    Ingredient(id: 1, name: "chives", amount: 1, unit: "tablespoon")
            ]),
            Recipe(id: 658725, image: "https://spoonacular.com/recipeImages/658725-556x370.jpg", title: "Rocky Road Ice Cream", readyInMinutes: 45, sourceUrl: "https://www.foodista.com/recipe/WGM3YMVS/rocky-road-ice-cream", usedIngredients: [], missedIngredients: nil, ingredients: [
                    Ingredient(id: 0, name: "brie", amount: 5, unit: "oz"),
                    Ingredient(id: 1, name: "chives", amount: 1, unit: "tablespoon")
            ]),
            Recipe(id: 658725, image: "https://spoonacular.com/recipeImages/658725-556x370.jpg", title: "Rocky Road Ice Cream", readyInMinutes: 45, sourceUrl: "https://www.foodista.com/recipe/WGM3YMVS/rocky-road-ice-cream", usedIngredients: [], missedIngredients: nil, ingredients: [
                    Ingredient(id: 0, name: "brie", amount: 5, unit: "oz"),
                    Ingredient(id: 1, name: "chives", amount: 1, unit: "tablespoon")
            ])]
        RecipesListView(recipes: recipes)
    }
}
