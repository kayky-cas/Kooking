require("dotenv").config();

const express = require("express");
const axios = require("axios").default;
const fs = require("fs");

const app = express();

const URL = "https://api.spoonacular.com/recipes";

const fecthInstanse = axios.create({
  headers: { "x-api-key": process.env["API_KEY"] },
});

function transformInIngredients(ingredients) {
  return ingredients.map((ingredient) => {
    return {
      id: ingredient.id,
      name: ingredient.name,
      amount: ingredient.amount,
      unit: ingredient.unit,
    };
  });
}

app.get("/recipes", async (req, res) => {
  const data = await fecthInstanse.get(URL + "/random?number=50");

  console.log("GET - /recipes");

  res.json(
    data.data.recipes.map((r) => {
      return {
        id: r.id,
        title: r.title,
        image: r.image,
        readyInMinutes: r.readyInMinutes,
        sourceUrl: r.sourceUrl,
        ingredients: transformInIngredients(r.extendedIngredients),
        // missedIngredientCount: null,
        // missedIngredients: null,
        // usedIngredientCount: null,
        // usedIngredients: null,
      };
    })
  );

  // res.json(data.data);
});

app.get("/recipes/ingredients/:ingredients", async (req, res) => {
  const ingredients = req.params["ingredients"];

  console.log(`GET - /recipes/ingredients/${ingredients}`);

  const fetchedData = await fecthInstanse.get(
    URL +
      "/findByIngredients?ranking=2&ignorePantry=true&ingredients=" +
      ingredients
  );

  let ids = "";

  for (const recipe of fetchedData.data) {
    ids += recipe.id + ",";
  }

  const fecthedRecipes = await fecthInstanse.get(
    URL +
      "/informationBulk?limitLicense=true?includeNutrition=false&ids=" +
      ids.slice(0, -1)
  );

  const recipes = fecthedRecipes.data.map((r) => {
    const recipe = fetchedData.data.find((v) => v.id === r.id);

    return {
      id: r.id,
      title: r.title,
      image: r.image,
      readyInMinutes: r.readyInMinutes,
      sourceUrl: r.sourceUrl,
      missedIngredients: transformInIngredients(recipe.missedIngredients),
      usedIngredients: transformInIngredients(recipe.usedIngredients),
      ingredients: transformInIngredients(
        recipe.missedIngredients.concat(recipe.usedIngredients)
      ),
    };
  });

  res.json(recipes);
});

app.get("/ingredients", async (req, res) => {
  console.log(`GET - /ingredients/`);

  fs.readFile("./ingresients.me", (err, file) => {
    const ingrStr = file.toString().split("\n");

    const arr = ingrStr.map((v) => {
      const spl = v.split(";");

      return {
        id: parseInt(spl[1]),
        name: spl[0],
        amount: 0,
        unit: "",
      };
    });

    res.json(arr);
  });
});

app.listen(3000, () => console.log("http://localhost:3000"));
