//
//  Recipe.swift
//  Kooking
//
//  Created by Giancarlo Mena on 27/07/22.
//

import Foundation

struct Recipe: Identifiable, Codable {
    let id: String
    let image: String?
    let label: String
    let ingredients: [IngredientInRecipe]
    var url: String?
    var calories: Double
    var totalTime: Double
}