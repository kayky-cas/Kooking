//
//  RecipeSheet.swift
//  Kooking
//
//  Created by Giancarlo Mena on 27/07/22.
//

import SwiftUI

struct RecipeSheet: View {
    var recipe: Recipe
    
    var body: some View {
        VStack (alignment: .center) {
            AsyncImage(url: URL(string: recipe.image))
            Text(recipe.name)
            IngredientList(ingredients: recipe.ingredients)
        }
    }
}

struct RecipeSheet_Previews: PreviewProvider {
    
    static var previews: some View {
        RecipeSheet(recipe: <#T##Recipe#>)
    }
}
