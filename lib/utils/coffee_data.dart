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
    RecipeStep(
        "Drain rinse water by placing the brewer on top of the decanter. Be sure to dump your rinse water from the decanter as well.",
        15),
    RecipeStep(
        "Weigh out 25g of whole bean coffee. Grind medium-coarse and pour into filter.",
        45),
    RecipeStep("Place everything on your scale and tare it to zero.", 10),
    RecipeStep(
        "Start timer and pour 50g of water over the coffee, making sure to saturate all the grounds thoroughly. Allow the coffee to bloom for 30 seconds.",
        90),
    RecipeStep(
        "Begin pouring water and stop when youve reached 450g of water. Technique is not as important here as it would be with a pour over, just be sure to fully saturate the grounds.",
        15),
    RecipeStep("Let sit until the timer has reached 2 minutes.", 120),
    RecipeStep(
        "Gently lift the brewer and place it on top of the decanter. This will allow the coffee to begin draining. It should be done draining around 3.5 - 4 minutes.",
        240),
    RecipeStep(
        "Give the decanter a swirl to aerate the coffee, pour yourself a cup, and enjoy!",
        15)
  ];
  CoffeeRecipe recipe = CoffeeRecipe("PT's", 25, 450, "Medium-coarse coffee",
      "The original recipe: makes one delicious cup", steps);
  return recipe;
}

CoffeeRecipe makeTexasCoffeeSchoolRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Bloom coffee grounds with 100g of water", 30),
    RecipeStep("Add 240g of water and steep coffee", 150),
    RecipeStep("Drawdown coffee", 90),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Texas Coffee School",
      24,
      340,
      "coarse ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

CoffeeRecipe makeHomegroundsRecipe() {
  List<RecipeStep> steps = [
    RecipeStep(
        "Heat water between 195 and 205 degrees Fahrenheit (90 to 96 degrees Celsius)",
        60),
    RecipeStep(
        "Weigh 15 grams of coffee beans using a coffee scale to brew an 8-ounce coffee using a 1:15 ratio of coffee to water.",
        30),
    RecipeStep(
        "Place the filter in the dripper and pour hot water around it in a circle (making sure to get up the sides) for about five seconds. Discard the water in the cup or carafe below",
        5),
    RecipeStep(
        "if not grinded, grind your weighed beans to medium-fine using a good-quality burr grinder.",
        30),
    RecipeStep("Add your ground coffee to the bottom of the filter.", 10),
    RecipeStep(
        "Slowly pour the the water over the grounds. Start at the center and move out in a widening spiral to wet all the grounds evenly. Stop when you’ve added 225 grams of water for a 1:15 ratio.",
        60),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Homegrounds",
      15,
      225,
      "Medium-fine ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

List<CoffeeRecipe> getAllRecipes() {
  return [
    makeSweetMariasRecipe(),
    makePT(),
    makeTexasCoffeeSchoolRecipe(),
    makeHomegroundsRecipe()
  ];
}

class CoffeeData {
  static List<CoffeeRecipe> loadRecipes() {
    return getAllRecipes();
  }
}
