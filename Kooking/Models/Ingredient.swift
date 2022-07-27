//
//  Ingredient.swift
//  Kooking
//
//  Created by Giancarlo Mena on 26/07/22.
//

import Foundation

struct Ingredient: Identifiable, Codable {
    let id: String
    let amount: Double
    let unitLong: String
    let unitShort: String
    let name: String
    let original: String
}
