import 'recipe_step.dart';

class CoffeeRecipe {
  String name;
  int coffeeVolumeGrams;
  String grindSize;
  int waterVolumeGrams;
  String miscDetails;
  List<RecipeStep> steps;

  CoffeeRecipe(name, coffeeVolumeGrams, waterVolumeGrams, grindSize,
      miscDetails, steps) {
    //add any rules to reject invalid values
    //for example, reject negative gram amounts
    if (name == null || name.trim().isEmpty)
      throw ArgumentError('Name cannot be null or empty');
    else
      this.name = name;
    if (coffeeVolumeGrams < 0)
      throw ArgumentError('Coffee volume cannot be negative or empty.');
    else
      this.coffeeVolumeGrams = coffeeVolumeGrams;
    if (waterVolumeGrams < 0)
      throw ArgumentError('Water volume cannot be negative or empty.');
    else
      this.waterVolumeGrams = waterVolumeGrams;
    if (!checkForWords(grindSize))
      throw ArgumentError('Invalid grind size: $grindSize');
    else
      this.grindSize = grindSize;
    this.miscDetails = miscDetails;
    if (steps == null || steps.isEmpty)
      throw ArgumentError('steps cannot be null or empty');
    else
      this.steps = steps;
  }
  bool checkForWords(String sentence) {
    // Words to look for
    List<String> wordsToFind = [
      'fine',
      'corase',
      'meduim corase',
      'medium',
      'extra fine'
    ];

    String lowercaseSentence = sentence.toLowerCase();

    // Check if any part of the wordsToFind is a substring of the sentence
    return wordsToFind
        .any((word) => lowercaseSentence.contains(word.toLowerCase()));
  }
}
