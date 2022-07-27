//
//  IngredientsInRecipe.swift
//  Kooking
//
//  Created by Giancarlo Mena on 27/07/22.
//

import Foundation

struct IngredientInRecipe: Identifiable, Codable {
    let id: Int
    let name: String
    let amount: Double
    let unit: String
}
