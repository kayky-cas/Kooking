//
//  Ingredient.swift
//  Kooking
//
//  Created by Giancarlo Mena on 26/07/22.
//

import Foundation

struct Ingredient: Identifiable, Codable {
    let id: String
    
    let name: String
    var type: String?
    var quant: Double?
    
}
