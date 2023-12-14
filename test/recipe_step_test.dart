import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/screens/recipe_steps_screen.dart';
import 'package:homebrew_dripper/screens/done_screen.dart';

void main() {
  test('creates a valid coffee recipe', () {
    //make a coffee recipe
    CoffeeRecipe maketestRecipe() {
      List<RecipeStep> steps = [
        RecipeStep("Add 360g water", 5),
        RecipeStep("Cover and wait", 5),
        RecipeStep("Stir", 5),
        RecipeStep("Cover and wait", 5),
        RecipeStep("Stir", 5),
      ];
      CoffeeRecipe recipe = CoffeeRecipe(
          "Test Recipe",
          22,
          360,
          "finely ground coffee",
          "The original recipe: makes one delicious cup",
          steps);
      return recipe;
    }

    CoffeeRecipe testRecipe = maketestRecipe();

    //check that it has the right data
    expect(testRecipe.name, "Test Recipe");
    expect(testRecipe.coffeeVolumeGrams, 22);
    expect(testRecipe.waterVolumeGrams, 360);
    expect(testRecipe.grindSize, "finely ground coffee");
    expect(
        testRecipe.miscDetails, 'The original recipe: makes one delicious cup');
    expect(testRecipe.steps[0].text, "Add 360g water");
    expect(testRecipe.steps[0].time, 5);
    expect(testRecipe.steps[1].text, "Cover and wait");
    expect(testRecipe.steps[1].time, 5);
    expect(testRecipe.steps[2].text, "Stir");
    expect(testRecipe.steps[2].time, 5);
    expect(testRecipe.steps[3].text, "Cover and wait");
    expect(testRecipe.steps[3].time, 5);
    expect(testRecipe.steps[4].text, "Stir");
    expect(testRecipe.steps[4].time, 5);
  });

  //how do we test rejecting invalid coffee recipes?
  test('test invalid name', () {
    expect(
        () => CoffeeRecipe(null, 22, 360, 'finely ground coffee', 'Misc',
            ["Add 360g water", 5]),
        throwsArgumentError);
    expect(
        () => CoffeeRecipe(
            '', 22, 360, 'finely ground coffee', 'Misc', ["Add 360g water", 5]),
        throwsArgumentError);
  });
  test('test invalid coffee grams', () {
    expect(
        () => CoffeeRecipe('Test Recipe', -22, 360, 'finely ground coffee',
            'Misc', ["Add 360g water", 5]),
        throwsArgumentError);
  });

  test('test invalid water grams', () {
    expect(
        () => CoffeeRecipe('Test Recipe', 22, -360, 'finely ground coffee',
            'Misc', ["Add 360g water", 5]),
        throwsArgumentError);
  });

  test('test invalid grind size', () {
    expect(
        () => CoffeeRecipe('Test Recipe', 22, 360, 'invalid grind size', 'Misc',
            ["Add 360g water", 5]),
        throwsArgumentError);
  });

  test('test invalid steps', () {
    expect(
        () => CoffeeRecipe(
            'Test Recipe', 22, 360, 'finely ground coffee', 'Misc', null),
        throwsArgumentError);
    expect(
        () => CoffeeRecipe(
            'Test Recipe', 22, 360, 'finely ground coffee', 'Misc', []),
        throwsArgumentError);
  });

  testWidgets('Make sure timer works properly', (WidgetTester tester) async {
    // Create a CoffeeRecipe with a single step for testing
    CoffeeRecipe makeTestRecipe() {
      List<RecipeStep> step = [
        RecipeStep("Step 1", 2), // Set a short time for testing
      ];
      return CoffeeRecipe(
        "Test Recipe",
        22,
        360,
        "finely ground coffee",
        "The original recipe: makes one delicious cup",
        step,
      );
    }

    // Build our widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: RecipeStepsScreen(makeTestRecipe()),
    ));

    // Verify the initial state of the screen
    expect(find.text('2'),
        findsOneWidget); // Check if the initial time is displayed

    // Wait for the timer to reach zero
    await tester.pump(Duration(seconds: 2));

    // Wait for the widgets to rebuild after the timer reaches zero
    await tester.pump();

    // Verify that the timer has reached zero
    expect(find.text('0'), findsOneWidget);
  });
  testWidgets('Make sure timer remains at zero after trying to go negative',
      (WidgetTester tester) async {
    // Create a CoffeeRecipe with a single step for testing
    CoffeeRecipe makeTestRecipe() {
      List<RecipeStep> step = [
        RecipeStep("Step 1", 10), // Set a longer time for testing
      ];
      return CoffeeRecipe(
        "Test Recipe",
        22,
        360,
        "finely ground coffee",
        "The original recipe: makes one delicious cup",
        step,
      );
    }

    // Build our widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: RecipeStepsScreen(makeTestRecipe()),
    ));

    // Verify the initial state of the screen
    expect(find.text('10'),
        findsOneWidget); // Check if the initial time is displayed

    // Wait for the timer to reach zero
    await tester.pump(Duration(seconds: 10));

    // Wait for the widgets to rebuild after the timer reaches zero
    await tester.pump();

    // Verify that the timer has reached zero
    expect(find.text('0'), findsOneWidget);

    // Wait for the widgets to rebuild after trying to simulate a negative timer
    await tester.pump();

    // Verify that the timer remains at zero and doesn't go negative
    expect(find.text('0'), findsOneWidget);
  });
}
