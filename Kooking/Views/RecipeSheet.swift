//
//  RecipeView.swift
//  Kooking
//
//  Created by Kayky Belleboni Casagrande on 27/07/22.
//

import SwiftUI

struct RecipeSheet: View {
   
    @Binding var recipe: Recipe?
    
    var body: some View {
        GeometryReader { g in
            VStack(alignment: .leading) {
                AsyncImage(
                    url: URL(string: recipe?.image ?? "https://www.salonlfc.com/wp-content/uploads/2018/01/image-not-found-scaled.png"),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: g.size.width)
                            
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                VStack(alignment: .leading) {
                    Text(recipe!.title)
                        .font(.title)
                        .padding(.bottom, 10)
                        
                    Text("\(recipe!.readyInMinutes, specifier: "%.0f") minutes")
                        .font(.title2)
                        .foregroundColor(.blue)
                        .italic()
                    
                    Divider()
                    
                    Text("Ingredients:")
                        .font(.title3)
                        .padding(.bottom, 3)
                    VStack(alignment: .leading) {
                        ForEach(0..<recipe!.ingredients.count, id: \.self) {
                            i in
                            
                            Text("- \(recipe!.ingredients[i].name): ")
                                .bold()
                            + Text("\(String.init(format: "%.2f", recipe!.ingredients[i].amount)) \(translate(unit:recipe!.ingredients[i].unit))")
                                .italic()
                        }
                    }.padding(.leading, 20)
                    
                    
                    Text(try! AttributedString(markdown: "See more in the [recipe page](\(recipe!.sourceUrl))!"))
                        .padding(.top, 50)
                }.padding()
            }
        }
    }
    
    func translate(unit: String) -> String {
        if (unit == "tablespoon") {
            return "table spoon"
        }
        
        if (unit == "tablespoons") {
            return "table spoons"
        }
        
        if (unit == "teaspoon") {
            return "tea spoon"
        }
        
        if (unit == "teaspoons") {
            return "tea spoons"
        }
        
        return unit
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        let recipe = Recipe(id: 658725, image: "https://spoonacular.com/recipeImages/658725-556x370.jpg", title: "Rocky Road Ice Cream", readyInMinutes: 45, sourceUrl: "https://www.foodista.com/recipe/WGM3YMVS/rocky-road-ice-cream", usedIngredients: [], missedIngredients: nil, ingredients: [
            Ingredient(id: 0, name: "brie", amount: 5, unit: "oz"),
            Ingredient(id: 1, name: "chives", amount: 1, unit: "tablespoon")
    ])
        RecipeSheet(recipe: .constant(recipe))
            .padding()
            .previewInterfaceOrientation(.portrait)
    }
}
