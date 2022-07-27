//
//  IngredientList.swift
//  Kooking
//
//  Created by Giancarlo Mena on 27/07/22.
//

import SwiftUI

struct IngredientList: View {
    var ingredients: [Ingredient]
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0 ..< ingredients.count, id: \.self) {
                    index in
                    IngredientView(ingredient: ingredients[index])
                }
            }
        }
    }
}

struct IngredientList_Previews: PreviewProvider {
    static var previews: some View {
        let ingredients = [Ingredient(food: "olive oil", image: "https://www.edamam.com/food-img/4d6/4d651eaa8a353647746290c7a9b29d84.jpg", measure: "cup", quantity: 0.5, weight: 108.0), Ingredient(food: "olive oil", image: "https://www.edamam.com/food-img/4d6/4d651eaa8a353647746290c7a9b29d84.jpg", measure: "cup", quantity: 0.5, weight: 108.0), Ingredient(food: "olive oil", image: "https://www.edamam.com/food-img/4d6/4d651eaa8a353647746290c7a9b29d84.jpg", measure: "cup", quantity: 0.5, weight: 108.0), Ingredient(food: "olive oil", image: "https://www.edamam.com/food-img/4d6/4d651eaa8a353647746290c7a9b29d84.jpg", measure: "cup", quantity: 0.5, weight: 108.0), Ingredient(food: "olive oil", image: "https://www.edamam.com/food-img/4d6/4d651eaa8a353647746290c7a9b29d84.jpg", measure: "cup", quantity: 0.5, weight: 108.0), Ingredient(food: "olive oil", image: "https://www.edamam.com/food-img/4d6/4d651eaa8a353647746290c7a9b29d84.jpg", measure: "cup", quantity: 0.5, weight: 108.0), Ingredient(food: "olive oil", image: "https://www.edamam.com/food-img/4d6/4d651eaa8a353647746290c7a9b29d84.jpg", measure: "cup", quantity: 0.5, weight: 108.0)]
        IngredientList(ingredients: ingredients)
    }
}
