//
//  AddIngredientSheet.swift
//  Kooking
//
//  Created by Kayky Belleboni Casagrande on 28/07/22.
//

import SwiftUI

struct AddIngredientSheet: View {
    @Binding var ingredient: Ingredient
    
    @State var amount: Double?
    @State var unit: MetricUnit = .oz
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var auth: AuthenticationViewModel
    @EnvironmentObject var recipe: RecipesViewModel
    
    
    var body: some View {
        VStack {
                
                List {
                    Picker("Unit", selection: $unit) {
                        ForEach(MetricUnit.allCases) { unit in
                            Text(unit.rawValue.capitalized)
                        }
                    }.pickerStyle(.segmented)
                    
                    TextField("Digit the amount of \(unit.rawValue)", value: $amount, format: .number)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)
                        .onChange(of: amount) { newValue in
                            print(newValue ?? 0)
                    }
                }
            
            HStack {
                Button{
                    var newIngredient = ingredient
                    newIngredient.unit = unit.rawValue
                    newIngredient.amount = amount ?? 0
                    
                    auth.currentUser?.ingredients.append(newIngredient)
                    
                    recipe.getRecipesByIngredients(ingredients: auth.currentUser?.ingredients ?? [])
                    
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Add")
                        .font(.body)

                }
                
                
            }.padding(.horizontal, 30)
        }
    }
}

struct AddIngredientSheet_Previews: PreviewProvider {
    static var previews: some View {
        let ingredient = Ingredient(id: 1245, name: "Apple", amount: 0, unit: "")
        AddIngredientSheet(ingredient: .constant(ingredient))
            .frame(height: 200)
    }
}
