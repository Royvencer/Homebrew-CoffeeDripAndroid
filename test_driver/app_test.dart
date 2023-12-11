// Imports the Flutter Driver API.
@Timeout(Duration(minutes: 20))

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

  group('Sad Paths', () {

    test("sweet maria's: make sure that when 30 seconds have not passed then still on the same step", () async{
      final recipeSelectionScreen = find.byValueKey('coffee-recipes');
      expect(await driver.getText(recipeSelectionScreen), "Coffee Recipes");

      final selectSweetMaria = find.text("Sweet Maria's");
      await driver.tap(selectSweetMaria);

      final sweetMariasCoffeeGrams = find.byValueKey('recipe-coffee-volume');
      expect(await driver.getText(sweetMariasCoffeeGrams), "22");

      final sweetMariasWaterGrams = find.byValueKey('recipe-water-volume');
      expect(await driver.getText(sweetMariasWaterGrams), "360");

      final sweetMariasStartButton = find.byValueKey('start-button');
      await driver.tap(sweetMariasStartButton);

      final sweetMariasFirstStep = find.byValueKey('current-step-text');
      expect(await driver.getText(sweetMariasFirstStep), "Add 360g water");
      //when 15 seconds have passed
      await Future.delayed(Duration(seconds: 15));
      expect(await driver.getText(sweetMariasFirstStep), "Add 360g water");
      //when 10 more seconds have passed
      await Future.delayed(Duration(seconds: 10));
      expect(await driver.getText(sweetMariasFirstStep), "Add 360g water");
      await Future.delayed(Duration(seconds: 6));
      
    });

    test("sweet maria's: make sure that when 90 seconds have not passed then still on the same step", () async{
      final sweetMariasSecondStep = find.byValueKey('current-step-text');
      expect(await driver.getText(sweetMariasSecondStep), "Cover and wait");
      //when 50 seconds have passed
      await Future.delayed(Duration(seconds: 50));
      expect(await driver.getText(sweetMariasSecondStep), "Cover and wait");
      //when 30 more seconds have passed
      await Future.delayed(Duration(seconds: 30));
      expect(await driver.getText(sweetMariasSecondStep), "Cover and wait");
      await Future.delayed(Duration(seconds: 11));
    });

    test("sweet maria's: make sure that when 15 seconds have not passed then still on the same step", () async{
      final sweetMariasThirdStep = find.byValueKey('current-step-text');
      expect(await driver.getText(sweetMariasThirdStep), "Stir");
      //when 10 seconds have passed
      await Future.delayed(Duration(seconds: 10));
      expect(await driver.getText(sweetMariasThirdStep), "Stir");
      await Future.delayed(Duration(seconds: 6));
    });

    test("sweet maria's: make sure that when 75 seconds have not passed then still on the same step", () async{
      final sweetMariasFourthStep = find.byValueKey('current-step-text');
      expect(await driver.getText(sweetMariasFourthStep), "Cover and wait");
      //when 60 seconds have passed
      await Future.delayed(Duration(seconds: 60));
      expect(await driver.getText(sweetMariasFourthStep), "Cover and wait");
      //when 10 more seconds pass
      await Future.delayed(Duration(seconds: 10));
      expect(await driver.getText(sweetMariasFourthStep), "Cover and wait");
      await Future.delayed(Duration(seconds: 6));
    });

    test("sweet maria's: make sure that when 15 seconds have not passed then still on the same step", () async{
      final sweetMariasFifthStep = find.byValueKey('current-step-text');
      expect(await driver.getText(sweetMariasFifthStep), "Stir");
      //when 10 seconds have passed
      await Future.delayed(Duration(seconds: 10));
      expect(await driver.getText(sweetMariasFifthStep), "Stir");
      await Future.delayed(Duration(seconds: 6));

      final doneScreenText = find.byValueKey('done-screen-text');
      expect(await driver.getText(doneScreenText),
          "enjoy your amazing handmade coffee");

      final doneButton = find.byValueKey('done-button');
      await driver.tap(doneButton);
      
      final recipeSelectionScreen = find.byValueKey('coffee-recipes');
      expect(await driver.getText(recipeSelectionScreen), "Coffee Recipes");
    });

    test("Texas Coffee School: make sure that when 30 seconds have not passed then still on the same step", () async {
      final recipeSelectionScreen = find.byValueKey('coffee-recipes');
      expect(await driver.getText(recipeSelectionScreen), "Coffee Recipes");

      final selectTexasCoffeeSchool = find.text("Texas Coffee School");
      await driver.tap(selectTexasCoffeeSchool);

      final texasCoffeeSchoolCoffeeGrams = find.byValueKey('recipe-coffee-volume');
      expect(await driver.getText(texasCoffeeSchoolCoffeeGrams), "24");

      final texasCoffeeSchoolWaterGrams = find.byValueKey('recipe-water-volume');
      expect(await driver.getText(texasCoffeeSchoolWaterGrams), "340");

      final texasCoffeeSchoolStartButton = find.byValueKey('start-button');
      await driver.tap(texasCoffeeSchoolStartButton);

      final texasCoffeeSchoolFirstStep = find.byValueKey('current-step-text');
      expect(await driver.getText(texasCoffeeSchoolFirstStep), "Bloom coffee grounds with 100g of water");
      await Future.delayed(Duration(seconds: 15));
      expect(await driver.getText(texasCoffeeSchoolFirstStep), "Bloom coffee grounds with 100g of water");
      await Future.delayed(Duration(seconds: 10));
      expect(await driver.getText(texasCoffeeSchoolFirstStep), "Bloom coffee grounds with 100g of water");
      await Future.delayed(Duration(seconds: 6));
    });

    test("Texas Coffee School: make sure that when 150 seconds have not passed then still on the same step", () async {
      final texasCoffeeSchoolSecondStep = find.byValueKey('current-step-text');
      expect(await driver.getText(texasCoffeeSchoolSecondStep), "Add 240g of water and steep coffee");
      await Future.delayed(Duration(seconds: 100));
      expect(await driver.getText(texasCoffeeSchoolSecondStep), "Add 240g of water and steep coffee");
      await Future.delayed(Duration(seconds: 40));
      expect(await driver.getText(texasCoffeeSchoolSecondStep), "Add 240g of water and steep coffee");
      await Future.delayed(Duration(seconds: 11));
    });

    test("Texas Coffee School: make sure that when 90 seconds have not passed then still on the same step", () async {
      final texasCoffeeSchoolThirdStep = find.byValueKey('current-step-text');
      expect(await driver.getText(texasCoffeeSchoolThirdStep), "Drawdown coffee");
      await Future.delayed(Duration(seconds: 50));
      expect(await driver.getText(texasCoffeeSchoolThirdStep), "Drawdown coffee");
      await Future.delayed(Duration(seconds: 30));
      expect(await driver.getText(texasCoffeeSchoolThirdStep), "Drawdown coffee");
      await Future.delayed(Duration(seconds: 11));

      final doneScreenText = find.byValueKey('done-screen-text');
      expect(await driver.getText(doneScreenText),
          "enjoy your amazing handmade coffee");

      final doneButton = find.byValueKey('done-button');
      await driver.tap(doneButton);

      final recipeSelectionScreen = find.byValueKey('coffee-recipes');
      expect(await driver.getText(recipeSelectionScreen), "Coffee Recipes");
    });
  }, timeout: Timeout(Duration(minutes: 10)));

  // group('Back button test', () {
 
  // },);
}
