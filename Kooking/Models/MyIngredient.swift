//
//  MyIngredient.swift
//  Kooking
//
//  Created by Giancarlo Mena on 27/07/22.
//

import Foundation

struct MyIngredient: Identifiable, Codable {
    var id: String { food }
    
    let food: String
    let measure: String
    let quantity: Double
    let weight: Double
}
