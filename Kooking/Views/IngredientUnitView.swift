//
//  IngredientUnitView.swift
//  Kooking
//
//  Created by Kayky Belleboni Casagrande on 28/07/22.
//

import SwiftUI

struct IngredientUnitView: View {
    var ingredient: Ingredient
    
    var body: some View {
        GeometryReader { g in
            HStack {
                Text(ingredient.name.capitalized)
                    .bold()
                Spacer()
                Text("\(ingredient.amount, specifier: "%.2f") \(ingredient.unit)")
                    .italic()
            }
        }
    }
}

struct IngredientUnitView_Previews: PreviewProvider {
    static var previews: some View {
        let ingredient = Ingredient(id: 12345, name: "Apple", amount: 2, unit: "oz")
        IngredientUnitView(ingredient: ingredient)
    }
}
