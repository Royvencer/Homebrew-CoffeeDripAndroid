import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/screens/recipe_steps_screen.dart';

class RecipeDetailScreen extends StatelessWidget {
  CoffeeRecipe recipe;

  RecipeDetailScreen(this.recipe);

  int totalTime() {
    int totalTime = 0;
    for (int x = 0; x < recipe.steps.length; x++) {
      totalTime += recipe.steps[x].time;
    }
    return totalTime;
  }

  String toTime(int timeInSecond) {
    int sec = timeInSecond % 60;
    int min = (timeInSecond / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: IconButton(
                key: Key('backButton'),
                icon: Icon(Icons.arrow_back_ios_rounded),
                color: Color(0xFF4C748B),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff4C748B), width: 3),
              borderRadius: BorderRadius.circular(20.0),
            ),
            margin: EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  recipe.name,
                  style: TextStyle(
                    fontFamily: 'Kollektif',
                    fontSize: 18.0,
                    color: Color(0xFF4C748B),
                  ),
                ),
                Divider(
                  color: Color(0xFF4C748B),
                  thickness: 1,
                  indent: 20,
                  endIndent: 20,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "${recipe.coffeeVolumeGrams}g - ${recipe.grindSize}",
                  key: Key('recipe-coffee-volume'),
                  style: TextStyle(
                    fontFamily: 'Kollektif',
                    fontSize: 14.0,
                    color: Color(0xFF4C748B),
                  ),
                ),
                Text(
                  "${recipe.waterVolumeGrams}g - water",
                  key: Key('recipe-water-volume'),
                  style: TextStyle(
                    fontFamily: 'Kollektif',
                    fontSize: 14.0,
                    color: Color(0xFF4C748B),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  recipe.miscDetails,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontStyle: FontStyle.italic,
                    fontSize: 10.0,
                    color: Color(0xFF4C748B),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Text(
                  "Steps",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Kollektif',
                    fontSize: 14.0,
                    color: Color(0xFF4C748B),
                  ),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Text(
                  "Total: ${toTime(totalTime())}",
                  key: Key('total-Time'),
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontFamily: 'Kollektif',
                    fontSize: 14.0,
                    color: Color(0xFF4C748B),
                  ),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < recipe.steps.length; i++)
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff4C748B), width: 3),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    margin: EdgeInsets.all(10.0),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Text(
                              recipe.steps[i].text,
                              key: Key('step_$i'),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Kollektif',
                                fontSize: 12.0,
                                color: Color(0xFF4C748B),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            child: Text(
                              toTime(recipe.steps[i].time),
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontFamily: 'Kollektif',
                                fontSize: 12.0,
                                color: Color(0xFF4C748B),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                ElevatedButton(
                  child: Text(
                    "Start",
                    key: Key("start-button"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14.0,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RecipeStepsScreen(recipe),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF4C748B),
                    fixedSize: const Size(250, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
