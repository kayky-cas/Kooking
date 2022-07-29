//
//  RecipesViewModel.swift
//  Kooking
//
//  Created by Kayky Belleboni Casagrande on 27/07/22.
//

import Foundation

class RecipesViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    @Published var myRecipes: [Recipe] = []
    @Published var allIngredients: [Ingredient] = []

    
    func getRecipesByIngredients(ingredients: [Ingredient]) {
        
        if ingredients.count == 0 {
            getRecipes(path: "ingredients/")
            return
        }
        
        var ingredientIDList = ""
        
        for i in 0..<ingredients.count {
            if i != 0  {
                ingredientIDList += "+"
            }
            
            let name = ingredients[i].name
            
            if name.split(separator: " ").count > 1 {
                let nameSplit = name.split(separator: " ")
                
                for j in 0..<nameSplit.count {
                    if j != 0  {
                        ingredientIDList += "+"
                    }
                    
                    ingredientIDList += "\(nameSplit[j])"
                    
                    if j < nameSplit.count - 1 {
                        ingredientIDList += ","
                    }
                }
            } else {
                ingredientIDList += "\(name)"
            }
            
            if i < ingredients.count - 1 {
                ingredientIDList += ","
            }
        }
        
        print(ingredientIDList)
        
        getRecipes(path: "ingredients/\(ingredientIDList)")
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
                        
                        if path == "" {
                            self.recipes = decodedRecipes.sorted(by: { recipe, next in
                                recipe.readyInMinutes < next.readyInMinutes
                            })
                        } else {
                            self.myRecipes = decodedRecipes.sorted(by: { recipe, next in
                                recipe.ingredients.count - recipe.usedIngredientCount! < next.ingredients.count - next.usedIngredientCount!
                            })
                        }
                        
                    } catch let error {

                        print(error.localizedDescription)
                    }
                }
            }
        }
        
        dataTask.resume()
    }
    
    func getIngredients() {
        guard let url = URL(string: "http://localhost:3000/ingredients") else {
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
                        let decodedRecipes = try JSONDecoder().decode([Ingredient].self, from: data)
                        self.allIngredients = decodedRecipes
                    } catch let error {
                        print("Não consegui traduzir")
                        print(error.localizedDescription)
                    }
                }
            }
        }
        
        dataTask.resume()
    }
}
