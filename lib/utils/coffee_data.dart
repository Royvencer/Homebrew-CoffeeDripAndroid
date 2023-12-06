import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';

CoffeeRecipe makeSweetMariasRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 360g water", 30),
    RecipeStep("Cover and wait", 90),
    RecipeStep("Stir", 15),
    RecipeStep("Cover and wait", 75),
    RecipeStep("Stir", 15),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Sweet Maria's",
      22,
      360,
      "finely ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

CoffeeRecipe makePT() {
  List<RecipeStep> steps = [
      RecipeStep("Place filter in the brewer and rinse with hot water.", 30),
         RecipeStep("Drain rinse water by placing the brewer on top of the decanter. Be sure to dump your rinse water from the decanter as well.", 15),
         RecipeStep("Weigh out 25g of whole bean coffee. Grind medium-coarse and pour into filter.", 45),
         RecipeStep("Place everything on your scale and tare it to zero.", 10),
        RecipeStep("Start timer and pour 50g of water over the coffee, making sure to saturate all the grounds thoroughly. Allow the coffee to bloom for 30 seconds.", 90),
       RecipeStep("Begin pouring water and stop when youve reached 450g of water. Technique is not as important here as it would be with a pour over, just be sure to fully saturate the grounds.", 15),
         RecipeStep("Let sit until the timer has reached 2 minutes.", 120),
         RecipeStep("Gently lift the brewer and place it on top of the decanter. This will allow the coffee to begin draining. It should be done draining around 3.5 - 4 minutes.", 240),
         RecipeStep("Give the decanter a swirl to aerate the coffee, pour yourself a cup, and enjoy!", 15)
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "PT's",
      25,
      450,
      "Medium-coarse coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

List<CoffeeRecipe> getAllRecipes() {
  return [makeSweetMariasRecipe(), makePT()];
}

class CoffeeData {
  static List<CoffeeRecipe> loadRecipes() {
    return getAllRecipes();
  }
}
