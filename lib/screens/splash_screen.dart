import 'package:flutter/material.dart';
import 'dart:async';
import 'recipe_selection_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 2);
    return Timer(duration, navigateToDeviceScreen);
  }

  navigateToDeviceScreen() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => RecipeSelectionScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4C748B),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("HOMEBREW", style: TextStyle(color: Color(0xFFFFFFFF), fontFamily: 'norwester' ,fontSize: 48),), Text("Handmade Coffee", style: TextStyle(color: Color(0xFFFFFFFF), fontFamily: 'Kollektif', fontSize: 18)), ],
        ),
      ),
    );
  }
}
