//
//  IngredientList.swift
//  Kooking
//
//  Created by Giancarlo Mena on 27/07/22.
//

import SwiftUI

struct IngredientView: View {
    var ingredient: Ingredient
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    AsyncImage(url: URL(string: ingredient.image))
                    VStack {
                        Text(ingredient.name)
                        Text("\(ingredient.weight)")
                        Text(ingredient.measure)
                        Text("\(ingredient.quantity)")
                    }
                    
                    Spacer()
                    
                    Button {
                        print("gfdg")
                    } label: {
                        Text("gsfasda")
                    }

                }
                .padding()
            }
            Divider()
        }
    }
}

struct IngredientView_Previews: PreviewProvider {
    static var previews: some View {
        let ingredient = Ingredient(name: "chicken", image: "https://www.edamam.com/food-img/4d6/4d651eaa8a353647746290c7a9b29d84.jpg", measure: "cup", quantity: 50, weight: 50)
        IngredientView(ingredient: ingredient)
    }
}
