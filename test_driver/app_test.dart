// Imports the Flutter Driver API.
@Timeout(Duration(minutes: 5))

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
    test("should give us complete guide on how to make Sweet Maria's coffee recipe", () async{
      final recipeSelectionScreen = find.byValueKey('coffee-recipes');
      expect(await driver.getText(recipeSelectionScreen), "Coffee Recipes");

      final firstListTileFinder = find.text("Sweet Maria's");
      await driver.tap(firstListTileFinder);

      final sweetMariasCoffeeGrams = find.byValueKey('recipe-coffee-volume');
      expect(await driver.getText(sweetMariasCoffeeGrams), "22");

      final sweetMariasWaterGrams = find.byValueKey('recipe-water-volume');
      expect(await driver.getText(sweetMariasWaterGrams), "360");

      //should be able to see the total time

      //should be able to see the add 360g water step

      final sweetMariasStartButton = find.byValueKey('start-button');
      await driver.tap(sweetMariasStartButton);

      final sweetMariasFirstStepTime = find.byValueKey('time-remaining');
      final sweetMariasFirstStep = find.byValueKey('current-step-text');
      expect(await driver.getText(sweetMariasFirstStepTime), "30");
      expect(await driver.getText(sweetMariasFirstStep), "Add 360g water");
      await Future.delayed(Duration(seconds: 31));

      final sweetMariasSecondStepTime = find.byValueKey('time-remaining');
      final sweetMariasSecondStep = find.byValueKey('current-step-text');
      expect(await driver.getText(sweetMariasSecondStepTime), "90");
      expect(await driver.getText(sweetMariasSecondStep), "Cover and wait");
      await Future.delayed(Duration(seconds: 91));

      final sweetMariasThirdStepTime = find.byValueKey('time-remaining');
      final sweetMariasThirdStep = find.byValueKey('current-step-text');
      expect(await driver.getText(sweetMariasThirdStepTime), "15");
      expect(await driver.getText(sweetMariasThirdStep), "Stir");
      await Future.delayed(Duration(seconds: 16));

      final sweetMariasFourthStepTime = find.byValueKey('time-remaining');
      final sweetMariasFourthStep = find.byValueKey('current-step-text');
      expect(await driver.getText(sweetMariasFourthStepTime), "75");
      expect(await driver.getText(sweetMariasFourthStep), "Cover and wait");
      await Future.delayed(Duration(seconds: 76));

      final sweetMariasFifthStepTime = find.byValueKey('time-remaining');
      final sweetMariasFifthStep = find.byValueKey('current-step-text');
      expect(await driver.getText(sweetMariasFifthStepTime), "15");
      expect(await driver.getText(sweetMariasFifthStep), "Stir");
      await Future.delayed(Duration(seconds: 16));

      final doneScreenText = find.byValueKey('done-screen-text');
      expect(await driver.getText(doneScreenText), "enjoy your amazing handmade coffee");


    }, timeout: Timeout.factor(2));
  }, timeout: Timeout(Duration(minutes: 5)));

  // group('Sad Paths', () {

  // },);
}
