import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/screens/done_screen.dart';

class RecipeStepsScreen extends StatefulWidget {
  CoffeeRecipe recipe;

  RecipeStepsScreen(this.recipe);

  @override
  _RecipeStepsScreenState createState() => _RecipeStepsScreenState();
}

class _RecipeStepsScreenState extends State<RecipeStepsScreen> {
  int currentStep;
  List<RecipeStep> remainingSteps;
  int stepTimeRemaining;
  Timer timer;

  @override
  void initState() {
    super.initState();

    int totalSteps = widget.recipe.steps.length;

    currentStep = 0;
    remainingSteps = widget.recipe.steps;

    //set the starting value of the timer
    stepTimeRemaining = widget.recipe.steps[currentStep].time;

    //make timer that ticks every one second
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // if timer reached zero
      if (stepTimeRemaining < 1) {
        //increase step
        currentStep++;

        //if we finished
        if (currentStep >= totalSteps) {
          //cancel timer
          timer.cancel();

          //navigate to done screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DoneScreen()),
          );
        } else {
          //if we did not finish yet
          //adjust the timer
          //reduce the list of remaining steps
          stepTimeRemaining = widget.recipe.steps[currentStep].time;
          remainingSteps = widget.recipe.steps.sublist(currentStep);
          setState(() {});
        }
      } else {
        //adjust time remaining by one
        stepTimeRemaining = stepTimeRemaining - 1;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    RecipeStep currentRecipeStep = widget.recipe.steps[currentStep];

    return Scaffold(
      backgroundColor: Color(0xff4C748B),
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.fromLTRB(0, 50, 0, 0)),
          Text("${stepTimeRemaining}", style: TextStyle(color: Color(0xFFFFFFFF), fontFamily: 'kollektif', fontSize: 96), textAlign: TextAlign.center, key: Key('time-remaining'),),
          Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0)),
          Text("${currentRecipeStep.text}", style: TextStyle(color: Color(0xFFFFFFFF), fontFamily: 'kollektif', fontSize: 24), textAlign: TextAlign.center,key: Key('current-step-text')),
          Padding(padding: EdgeInsets.fromLTRB(0, 60, 0, 0)),
          Container(
            margin: EdgeInsets.all(15.0),
            child: Text("Steps", style: TextStyle(color: Color(0xFFFFFFFF)),textAlign: TextAlign.left),
          ),
          for (RecipeStep step in widget.recipe.steps)
          Container( padding: EdgeInsets.all(15.0), // Adjust the padding value here
  child: ListTile(
              title: Text(step.text, style: TextStyle(color: Color(0xFFFFFFFF))),
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              dense: true,
              trailing: Text("${Duration(seconds: step.time).toString().substring(2, 7)}", style: TextStyle(color: Color(0xFFFFFFFF), fontFamily: 'kollektif', fontSize: 12)),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: step == currentRecipeStep ? Color(0xFFFFFFFF) : Colors.transparent, width: 3),
                borderRadius: BorderRadius.circular(12.0),
              )
              ),
            )
        ],
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
} 
