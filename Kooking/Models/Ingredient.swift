//
//  Ingredient.swift
//  Kooking
//
//  Created by Giancarlo Mena on 26/07/22.
//

import Foundation
import SwiftUI

struct Ingredient: Identifiable, Codable {
    var id: String { name }

    let name: String
    let image: String
    var measure: String
    var quantity: Double
    var weight: Double
}
