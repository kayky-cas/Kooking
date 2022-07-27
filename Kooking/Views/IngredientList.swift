//
//  IngredientList.swift
//  Kooking
//
//  Created by Giancarlo Mena on 27/07/22.
//

import SwiftUI

struct IngredientList: View {
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

struct IngredientList_Previews: PreviewProvider {
    static var previews: some View {
        let ingredients = [IngredientInRecipe(text: "6 bone-in chicken breast halves, or 6 chicken thighs and wings, skin-on",
                                              quantity: 6,
                                              measure: "half",
                                              food: "chicken breast",
                                              weight: 522,
                                               image: "https://www.edamam.com/food-img/093/093749f4c93e448119fc81976d2c3067.jpg")]
    
        IngredientList(ingredients: ingredients)
    }
}
