//
//  RecipesViewModel.swift
//  Kooking
//
//  Created by Kayky Belleboni Casagrande on 27/07/22.
//

import Foundation

class RecipesViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    func getRecipesByIngredients(ingredients: [Ingredient]) {
        var ingredientIDList = ""
        
        for ingredient in ingredients {
            ingredientIDList += "\(ingredient.id),"
        }
        
        getRecipes(path: "ingredients/\(ingredientIDList.remove(at: ingredientIDList.endIndex))")
    }
    
    func getRecipes(path: String = "") {
        guard let url = URL(string: "http://localhost:3000/recipes/\(path)") else {
            fatalError("Missing URL")
        }
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode < 400 {
                guard let data = data else {

                    return
                }
                DispatchQueue.main.async {
                    do {
                        let decodedRecipes = try JSONDecoder().decode([Recipe].self, from: data)
                        self.recipes = decodedRecipes
                    } catch let error {

                        print(error.localizedDescription)
                    }
                }
            }
        }
        
        dataTask.resume()
    }
}
