//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:homebrew_dripper/screens/recipe_selection_screen.dart';

class DoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "enjoy your amazing handmade coffee",
                textAlign: TextAlign.center,
                key: Key('done-screen-text'),
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18.0,
                  color: Color(0xFF4C748B),
                ),
              ),
            ),
          ),
          InkWell(
            key: Key('done-button'),
            onTap: () {
              // Navigate to the selection page when the text is tapped.
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeSelectionScreen()),
              );
            },
            child: Center(
              child: Text(
                'done',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18.0,
                  color: Color(0xFF4C748B), // Change the text color to white
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
