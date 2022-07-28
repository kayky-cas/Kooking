//
//  AddIngredientSheet.swift
//  Kooking
//
//  Created by Kayky Belleboni Casagrande on 28/07/22.
//

import SwiftUI

struct AddIngredientSheet: View {
    var ingredient: Ingredient
    
    @State var amount: Double?
    @State var unit: MetricUnit = .oz
    
    @EnvironmentObject var auth: AuthenticationViewModel
    
    
    var body: some View {
        VStack {
                
                List {
                    Picker("Unit", selection: $unit) {
                        ForEach(MetricUnit.allCases) { unit in
                            Text(unit.rawValue.capitalized)
                        }
                    }
                    
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
                } label: {
                    Text("Add")
                        .font(.body)

                }
                Spacer()
                Button{

                } label: {
                    Text("Cancel")
                        .font(.body)

                }
                
                
            }.padding(.horizontal, 30)
        }
    }
}

struct AddIngredientSheet_Previews: PreviewProvider {
    static var previews: some View {
        let ingredient = Ingredient(id: 1245, name: "Apple", amount: 0, unit: "")
        AddIngredientSheet(ingredient: ingredient)
            .frame(height: 200)
    }
}
