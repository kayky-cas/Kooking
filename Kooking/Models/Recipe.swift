//
//  Recipe.swift
//  Kooking
//
//  Created by Giancarlo Mena on 27/07/22.
//

import Foundation

struct Recipe: Identifiable, Decodable {
    var id: Int
    let image: String?
    let title: String
    let readyInMinutes: Double
    let sourceUrl: String
    var usedIngredientCount: Int? { usedIngredients?.count }
    let usedIngredients: [IngredientInRecipe]?
    var missedIngredientCount: Int? { missedIngredients?.count }
    let missedIngredients: [IngredientInRecipe]?
    let ingredients: [IngredientInRecipe]

}


//id": 637942,
//"title": "Chicken Arrozcaldo",
//"image": "https://spoonacular.com/recipeImages/637942-312x231.jpg",
//"imageType": "jpg",
//"usedIngredientCount": 4,
//"missedIngredientCount": 10,
//"missedIngredients": [],
//"usedIngredients": [],
//"unusedIngredients": [],
//"likes": 2
