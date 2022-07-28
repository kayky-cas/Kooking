//
//  MyIngredients.swift
//  Kooking
//
//  Created by Kayky Belleboni Casagrande on 28/07/22.
//

import SwiftUI

struct IngredientsView: View {
    var ingredients: [Ingredient] = []
    
    @State var showIngredientSheet = false
    @State var sheetIngredient: Ingredient?
    
    var body: some View {
        List {
            ForEach(0..<ingredients.count, id: \.self) { i in
                HStack {
                    Text(ingredients[i].name)
                    Spacer()
                    
                    Button {
                        showIngredientSheet.toggle()
                        sheetIngredient = ingredients[i]
                    } label: {
                        Text("Add")
                            .font(.caption)
                            .foregroundColor(.blue)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(Color(red: 242/255, green: 242/255, blue: 247/255))
                            .clipShape(Capsule())
                    }.buttonStyle(PlainButtonStyle())
                }
            }
        }.sheet(isPresented: $showIngredientSheet) {
            AddIngredientSheet(ingredient: sheetIngredient ?? Ingredient(id: 1, name: "", amount: 0, unit: ""))

        }
    }
}

struct IngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        let ingredients = [
            Ingredient(id: 1, name: "Apple", amount: 3, unit: "oz"),
            Ingredient(id: 1, name: "Apple", amount: 3, unit: "oz"),
            Ingredient(id: 1, name: "Apple", amount: 3, unit: "oz"),
            Ingredient(id: 1, name: "Apple", amount: 3, unit: "oz"),
        ]
        IngredientsView(ingredients: ingredients)
            .environmentObject(AuthenticationViewModel())
    }
}
