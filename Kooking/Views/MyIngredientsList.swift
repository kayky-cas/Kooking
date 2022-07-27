//
//  MyIngredientList.swift
//  Kooking
//
//  Created by Giancarlo Mena on 27/07/22.
//

import SwiftUI

struct MyIngredientList: View {
    var myIngredients: [MyIngredient]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0 ..< myIngredients.count, id: \.self) {
                    index in
                    MyIngredientView(myIngrdient: myIngredients[index])
                }
            }
        }
    }
}

struct MyIngredientList_Previews: PreviewProvider {
    static var previews: some View {
        let myIngredients = [MyIngredient(food: "olive oil", measure: "cup", quantity: 0.5, weight: 108.0), MyIngredient(food: "olive oil", measure: "cup", quantity: 0.5, weight: 108.0), MyIngredient(food: "olive oil", measure: "cup", quantity: 0.5, weight: 108.0), MyIngredient(food: "olive oil", measure: "cup", quantity: 0.5, weight: 108.0), MyIngredient(food: "olive oil", measure: "cup", quantity: 0.5, weight: 108.0), MyIngredient(food: "olive oil", measure: "cup", quantity: 0.5, weight: 108.0), MyIngredient(food: "olive oil", measure: "cup", quantity: 0.5, weight: 108.0), MyIngredient(food: "olive oil", measure: "cup", quantity: 0.5, weight: 108.0), MyIngredient(food: "olive oil", measure: "cup", quantity: 0.5, weight: 108.0), MyIngredient(food: "olive oil", measure: "cup", quantity: 0.5, weight: 108.0)]
        MyIngredientList(myIngredients: myIngredients)
    }
}
