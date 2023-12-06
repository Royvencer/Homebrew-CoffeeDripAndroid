// Imports the Flutter Driver API.
@Timeout(Duration(minutes: 10))

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });
  group('Happy Paths', () {
    /*
    */
    test("should give us complete guide on how to make Sweet Maria's coffee recipe", () async {
      final recipeSelectionScreen = find.byValueKey('coffee-recipes');
      expect(await driver.getText(recipeSelectionScreen), "Coffee Recipes");

      final selectSweetMaria = find.text("Sweet Maria's");
      await driver.tap(selectSweetMaria);

      final sweetMariasCoffeeGrams = find.byValueKey('recipe-coffee-volume');
      expect(await driver.getText(sweetMariasCoffeeGrams), "22");

      final sweetMariasWaterGrams = find.byValueKey('recipe-water-volume');
      expect(await driver.getText(sweetMariasWaterGrams), "360");

      //should be able to see the total time

      //should be able to see the add 360g water step

      final sweetMariasStartButton = find.byValueKey('start-button');
      await driver.tap(sweetMariasStartButton);

      // final sweetMariasFirstStepTime = find.byValueKey('time-remaining');
      final sweetMariasFirstStep = find.byValueKey('current-step-text');
      // expect(await driver.getText(sweetMariasFirstStepTime), "30");
      expect(await driver.getText(sweetMariasFirstStep), "Add 360g water");
      await Future.delayed(Duration(seconds: 31));

      // final sweetMariasSecondStepTime = find.byValueKey('time-remaining');
      final sweetMariasSecondStep = find.byValueKey('current-step-text');
      // expect(await driver.getText(sweetMariasSecondStepTime), "90");
      expect(await driver.getText(sweetMariasSecondStep), "Cover and wait");
      await Future.delayed(Duration(seconds: 91));

      // final sweetMariasThirdStepTime = find.byValueKey('time-remaining');
      final sweetMariasThirdStep = find.byValueKey('current-step-text');
      // expect(await driver.getText(sweetMariasThirdStepTime), "15");
      expect(await driver.getText(sweetMariasThirdStep), "Stir");
      await Future.delayed(Duration(seconds: 16));

      // final sweetMariasFourthStepTime = find.byValueKey('time-remaining');
      final sweetMariasFourthStep = find.byValueKey('current-step-text');
      // expect(await driver.getText(sweetMariasFourthStepTime), "75");
      expect(await driver.getText(sweetMariasFourthStep), "Cover and wait");
      await Future.delayed(Duration(seconds: 76));

      // final sweetMariasFifthStepTime = find.byValueKey('time-remaining');
      final sweetMariasFifthStep = find.byValueKey('current-step-text');
      // expect(await driver.getText(sweetMariasFifthStepTime), "15");
      expect(await driver.getText(sweetMariasFifthStep), "Stir");
      await Future.delayed(Duration(seconds: 16));

      final doneScreenText = find.byValueKey('done-screen-text');
      expect(await driver.getText(doneScreenText),
          "enjoy your amazing handmade coffee");

      final doneButton = find.byValueKey('done-button');
      await driver.tap(doneButton);

      expect(await driver.getText(recipeSelectionScreen), "Coffee Recipes");
    }, timeout: Timeout.factor(2));

    test("should give us complete guide on how to make Texas coffee school's recipe", () async {
      final recipeSelectionScreen = find.byValueKey('coffee-recipes');
      expect(await driver.getText(recipeSelectionScreen), "Coffee Recipes");

      final selectTexasCoffeeSchool = find.text("Texas Coffee School");
      await driver.tap(selectTexasCoffeeSchool);

      final texasCoffeeSchoolCoffeeGrams = find.byValueKey('recipe-coffee-volume');
      expect(await driver.getText(texasCoffeeSchoolCoffeeGrams), "24");

      final texasCoffeeSchoolWaterGrams = find.byValueKey('recipe-water-volume');
      expect(await driver.getText(texasCoffeeSchoolWaterGrams), "340");

      //should be able to see the total time

      //should be able to see the add 360g water step

      final texasCoffeeSchoolStartButton = find.byValueKey('start-button');
      await driver.tap(texasCoffeeSchoolStartButton);

      // final texasCoffeeSchoolFirstStepTime = find.byValueKey('time-remaining');
      final texasCoffeeSchoolFirstStep = find.byValueKey('current-step-text');
      // expect(await driver.getText(texasCoffeeSchoolFirstStepTime), "30");
      expect(await driver.getText(texasCoffeeSchoolFirstStep), "Bloom coffee grounds with 100g of water");
      await Future.delayed(Duration(seconds: 31));

      // final texasCoffeeSchoolSecondStepTime = find.byValueKey('time-remaining');
      final texasCoffeeSchoolSecondStep = find.byValueKey('current-step-text');
      // expect(await driver.getText(texasCoffeeSchoolSecondStepTime), "150");
      expect(await driver.getText(texasCoffeeSchoolSecondStep), "Add 240g of water and steep coffee");
      await Future.delayed(Duration(seconds: 151));

      // final texasCoffeeSchoolThirdStepTime = find.byValueKey('time-remaining');
      final texasCoffeeSchoolThirdStep = find.byValueKey('current-step-text');
      // expect(await driver.getText(texasCoffeeSchoolThirdStepTime), "90");
      expect(await driver.getText(texasCoffeeSchoolThirdStep), "Drawdown coffee");
      await Future.delayed(Duration(seconds: 91));

      final doneScreenText = find.byValueKey('done-screen-text');
      expect(await driver.getText(doneScreenText),
          "enjoy your amazing handmade coffee");

      final doneButton = find.byValueKey('done-button');
      await driver.tap(doneButton);

      expect(await driver.getText(recipeSelectionScreen), "Coffee Recipes");
    });
  }, timeout: Timeout(Duration(minutes: 10)));

  // group('Sad Paths', () {
 
  // },);
}
