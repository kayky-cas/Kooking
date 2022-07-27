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
            Text(recipe.label)
            IngredientList(ingredients: recipe.ingredients)
            Text(recipe.url)
        }
    }
}

struct RecipeSheet_Previews: PreviewProvider {
    static var previews: some View {
        let recipe = Recipe(image: "https://edamam-product-images.s3.amazonaws.com/web-img/e42/e42f9119813e890af34c259785ae1cfb.jpg?X-Amz-Security-Token=IQoJb3JpZ2luX2VjEI3%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaCXVzLWVhc3QtMSJHMEUCIA2%2FNIlt4csDKd9Q8uMnzul9DvPkwIXhyzfzDT4TWWp5AiEAwC83m5%2B1zouzgHBB2KHoJ6tRF3%2FSsuXEIBEUF1wxEngq2wQI1v%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FARAAGgwxODcwMTcxNTA5ODYiDKKuD9mevU8otKB53iqvBBh5ILqtDK0C3brNk6Bv8MUsuejKfKqujWIv7qd9QtLo38Mc%2FZjlY55xADOYGt6uD9Cbkd5%2FrbiyIcoINriCTnUydio%2BB%2BDfKmc%2FVfP%2FLdr1hq9P0335wkQybPrDFZ7Bah%2FIqgrGL8G8bjVjTAs8ItL2UbBVOFvMW7rffylP1NnEB8ddo%2FPRM24hwgpNWlPrKPc6JivBkPG0Lbf%2F1kAr8kzRHO0L72vumlB2eQMLvj23YFtepLAgnzHEpl2QMWJ0xZ3dCcR%2FFU8RUvG0VoPN5k%2BhEceD0tBRcsyIyO2OKCTUcVTd%2BJPfQJc8eHCsaG9M8r9%2FTyRaWehZcm2L9PQUCov4D0LM3V%2BCbTSlM1S4uDi2a5a60U85Sx7RUvKeKheGnetZmuOrLyUA7rX%2FimwGzlKyKDhVl%2FTznwvwHRts38TYoc9p5vUPHlrGYElVTFdQI2zAUzuG3AECxueSDSFlu9pHcDDNbTkI0T4VtyRXvi%2BPmH79zLxqNjE8NWJ5p4MJptjetjo3g%2FH7kmTwSwFtuh%2FVuib4nwqO6OFJrc%2BQKPESXFEFl5Xxpnq1rnPZCgJMHFeArX1EsoK%2FG%2FbWd3RT5dd2BxemY0GICvwYEzP66OsByDK3Zx8DRsRyoZGwrZNjww9AIwDzNIfpUSV3BxZWxjVoA8EfMxPs3y2M2VI%2Bq0Oj83ZteQqFqlqs5o8opxytxyk6oxoXup%2FhhHzBBYAyrV%2BdoB3fYphvm2RgzQBwf1cwlOKElwY6qQGNvyNE37V6UpGiPbvMk0sA7cUggta39Y3u0WW8UOCrVNoBWO4FctzvrEL2KnfGm7kIDQZjI2QDBJZpXx8ZHgLBmHE1jyrb%2FhRWvJtpGi1iMjIV2BQhTHxz4Hjt752KdfDsPDZhAsA9%2FDkixV2f1gREFtBxyi0Q0OTXAHZ1PImUWnnHRjjZ%2FmGM36IHFRMZM%2B5zbY7v4XI%2BJM1CQ%2F8ug%2BeCmBAPPswny0u8&X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20220727T124836Z&X-Amz-SignedHeaders=host&X-Amz-Expires=3599&X-Amz-Credential=ASIASXCYXIIFOPJZ6XWT%2F20220727%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=768a1f36941f11b1e68a4686eedb4112ac3c6b4007872d49f583f76219a0f5d0",
            label: "Chicken Vesuvio",
            ingredients: [IngredientInRecipe(text: "1/2 cup olive oil",
                                             quantity: 0.5,
                                             measure: "cup",
                                             food: "olive oil",
                                             weight: 108.0),
                          IngredientInRecipe(text: "1/2 cup olive oil",
                                                           quantity: 0.5,
                                                           measure: "cup",
                                                           food: "olive oil",
                                                           weight: 108.0),
                          IngredientInRecipe(text: "1/2 cup olive oil",
                                                           quantity: 0.5,
                                                           measure: "cup",
                                                           food: "olive oil",
                                                           weight: 108.0),
                          IngredientInRecipe(text: "1/2 cup olive oil",
                                                           quantity: 0.5,
                                                           measure: "cup",
                                                           food: "olive oil",
                                                           weight: 108.0),
                          IngredientInRecipe(text: "1/2 cup olive oil",
                                                           quantity: 0.5,
                                                           measure: "cup",
                                                           food: "olive oil",
                                                           weight: 108.0),
                          IngredientInRecipe(text: "1/2 cup olive oil",
                                                           quantity: 0.5,
                                                           measure: "cup",
                                                           food: "olive oil",
                                                           weight: 108.0)],
            url: "http://www.seriouseats.com/recipes/2011/12/chicken-vesuvio-recipe.html",
        calories: 4228.043058200812,
                            totalTime: 60.0
        )
        RecipeSheet(recipe: recipe)
    }
}
