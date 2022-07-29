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
    @State var sheetIngredient: Ingredient = Ingredient(id: 0, name: "", amount: 0, unit: "")
    
    @State var searchIngredient = ""
    
    var body: some View {
        List(filteredIngredients) { ingredient in
            HStack {
                Text(ingredient.name.capitalized)
                Spacer()
                
                Button {
                    showIngredientSheet.toggle()
                    sheetIngredient = ingredient
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
        }.searchable(text: $searchIngredient).sheet(isPresented: $showIngredientSheet) {
            AddIngredientSheet(ingredient: $sheetIngredient)

        }
    }
    
    var filteredIngredients: [Ingredient] {
        if searchIngredient.isEmpty {
            return ingredients
        }
        
        return ingredients.filter { $0.name.localizedCaseInsensitiveContains(searchIngredient) }
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
