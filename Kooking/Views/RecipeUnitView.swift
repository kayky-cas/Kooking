//
//  RecipeUnitView.swift
//  Kooking
//
//  Created by Kayky Belleboni Casagrande on 27/07/22.
//

import SwiftUI

struct RecipeUnitView: View {
    
    var recipe: Recipe

    var body: some View {
        GeometryReader { g in
            HStack {
                AsyncImage(
                    url: URL(string: recipe.image ?? "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled.png"),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                .frame(width: 120, height: g.size.height)
                .clipped()
                
                VStack(alignment: .leading) {
                    Text(recipe.title)
                        .font(.title3)
                        .bold()
                        .lineLimit(1)
                        .padding(.top, 10)
                    Text("\(recipe.readyInMinutes, specifier: "%.0f") min")
                        .foregroundColor(.blue)
                        .italic()
                    if recipe.usedIngredientCount != nil {
                        Text("You have \(recipe.usedIngredientCount! < recipe.ingredients.count ? String.init(format: "%d of", recipe.usedIngredientCount!) : "all") the ingredients!")
                            .font(.caption)
                            .foregroundColor(recipe.usedIngredientCount! < recipe.ingredients.count ? .gray : .green)
                            .lineLimit(1)
                    }
                    Spacer()
                }.padding(.leading, 20)
                
                Spacer()
            }
            
        }
        .padding(8)
    }
}

struct RecipeUnitView_Previews: PreviewProvider {
    static var previews: some View {
        let recipe = Recipe(id: 658725, image: "https://spoonacular.com/recipeImages/658725-556x370.jpg", title: "Rocky Road Ice Cream", readyInMinutes: 45, sourceUrl: "https://www.foodista.com/recipe/WGM3YMVS/rocky-road-ice-cream", usedIngredients: [], missedIngredients: nil, ingredients: [
                Ingredient(id: 0, name: "brie", amount: 5, unit: "oz"),
                Ingredient(id: 1, name: "chives", amount: 1, unit: "tablespoon")
        ])
        RecipeUnitView(recipe: recipe)
            .frame(height: 100)
    }
}
