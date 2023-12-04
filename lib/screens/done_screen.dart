import 'package:flutter/material.dart';

class DoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Column(
        children: [
          Text("enjoy your amazing handmade coffee", key: Key('done-screen-text')),
        ],
      ),
    );
  }
}
