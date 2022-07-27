//
//  IngredientList.swift
//  Kooking
//
//  Created by Giancarlo Mena on 27/07/22.
//

import SwiftUI

struct RecipeIngredientList: View {
    var ingredients: [IngredientInRecipe]
    
    var body: some View {
        VStack (alignment: .leading) {
            ForEach(0 ..< ingredients.count, id: \.self) {
                index in
                Text(ingredients[index].text)
            }
        }
    }
}

struct RecipeIngredientList_Previews: PreviewProvider {
    static var previews: some View {
        let ingredients = [IngredientInRecipe(text: "cake",
                                              quantity: 6,
                                              measure: "half",
                                              food: "chicken breast",
                                              weight: 522)
                                       ]
    
        RecipeIngredientList(ingredients: ingredients)
    }
}
