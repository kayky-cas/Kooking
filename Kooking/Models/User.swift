//
//  User.swift
//  Kooking
//
//  Created by Kayky Belleboni Casagrande on 28/07/22.
//

import Foundation

struct User: Identifiable {
    var id: String
    var name: String
    var ingredients: [Ingredient] = []
}
