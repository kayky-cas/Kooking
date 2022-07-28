//
//  IngredientsInRecipe.swift
//  Kooking
//
//  Created by Giancarlo Mena on 27/07/22.
//

import Foundation

struct Ingredient: Identifiable, Codable {
    let id: Int
    let name: String
    var amount: Double
    var unit: String
}
