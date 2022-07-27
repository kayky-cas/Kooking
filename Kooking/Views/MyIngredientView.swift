//
//  MyIngredientView.swift
//  Kooking
//
//  Created by Giancarlo Mena on 27/07/22.
//

import SwiftUI

struct MyIngredientView: View {
    var myIngrdient: MyIngredient
    var body: some View {
        HStack {
            VStack {
                Text(myIngrdient.food)
                HStack {
                    Text(myIngrdient.measure)
                    Text("\(myIngrdient.quantity)")
                    Text("\(myIngrdient.weight)")
                }
            }
            
            Spacer()
                
            HStack {
                Button {
                    print("delete")
                } label: {
                    Image(systemName: "trash")
                }
                
                Button {
                    print("edit")
                } label: {
                    Text("Edit")
                }
                
            }
        }
        .padding()
        Divider()
    }
}

struct MyIngredientView_Previews: PreviewProvider {
    static var previews: some View {
        let myIngredient = MyIngredient(food: "olive oil", measure: "cup", quantity: 0.5, weight: 108.0)
        MyIngredientView(myIngrdient: myIngredient)
    }
}
