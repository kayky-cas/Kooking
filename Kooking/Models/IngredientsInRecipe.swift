//
//  IngredientsInRecipe.swift
//  Kooking
//
//  Created by Giancarlo Mena on 27/07/22.
//

import Foundation

struct IngredientInRecipe: Codable {
    var text: String
    var quantity: Double?
    var measure: String?
    var food: String
    var weight: Double?
}
