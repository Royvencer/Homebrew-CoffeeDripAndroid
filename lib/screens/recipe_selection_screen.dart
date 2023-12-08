import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/screens/recipe_detail_screen.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';

class RecipeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView(
        children: [
          Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0),),
          Text("Coffee Recipes", style: TextStyle(color: Color(0xff4C748B), fontFamily: 'kollektif' ,fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center, key: Key("coffee-recipes")),
          Container(
            decoration: BoxDecoration(
            border: Border.all(color: Color(0xff4C748B), width: 3),
            borderRadius: BorderRadius.circular(20.0),
            ),
            margin: EdgeInsets.all(20.0),
            child: RecipeList(),
          ),
          Padding(padding: EdgeInsets.fromLTRB(0, 30, 0, 0),),
          Text("Resources", style: TextStyle(color: Color(0xff4C748B), fontFamily: 'kollektif' ,fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
          Container(
            decoration: BoxDecoration(
            border: Border.all(color: Color(0xff4C748B), width: 3),
            borderRadius: BorderRadius.circular(20.0),
            ),
            margin: EdgeInsets.all(20.0),
            child: ResourceList()
          )
        ],
      ),
    );
  }
}

class RecipeList extends StatelessWidget {
  int i = 0;
  List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (CoffeeRecipe recipe in recipes)
          Column(
            children: [
              ListTile(
                title: Text(recipe.name, style: TextStyle(color: Color(0xff4C748B), fontFamily: 'Montserrat', fontSize: 14, fontWeight: FontWeight.w500)),
                trailing: Icon(Icons.chevron_right, color: Color(0xff4C748B)),
                onTap: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) => RecipeDetailScreen(recipe)),);
                },
              ),
              Divider(
                color: Color(0xff4C748B),
                thickness: 1,
              ),
            ],
          ),
      ],
    );
  }
}

class ResourceList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text("Coffee", style: TextStyle(color: Color(0xff4C748B), fontFamily: 'Montserrat', fontSize: 14, fontWeight: FontWeight.w500)),
          trailing: Icon(Icons.chevron_right, color: Color(0xff4C748B)),
        ),
        Divider(
          color: Color(0xff4C748B),
          thickness: 1,
        ),
        ListTile(
          title: Text("Grinders", style: TextStyle(color: Color(0xff4C748B), fontFamily: 'Montserrat', fontSize: 14, fontWeight: FontWeight.w500)),
          trailing: Icon(Icons.chevron_right, color: Color(0xff4C748B)),
        ),
        Divider(
          color: Color(0xff4C748B),
          thickness: 1,
        ),
        ListTile(
          title: Text("Kettles", style: TextStyle(color: Color(0xff4C748B), fontFamily: 'Montserrat', fontSize: 14, fontWeight: FontWeight.w500)),
          trailing: Icon(Icons.chevron_right, color: Color(0xff4C748B)),
        ),
        Divider(
          color: Color(0xff4C748B),
          thickness: 1,
        ),
        ListTile(
          title: Text("Homebrew Dripper", style: TextStyle(color: Color(0xff4C748B), fontFamily: 'Montserrat', fontSize: 14, fontWeight: FontWeight.w500)),
          trailing: Icon(Icons.chevron_right, color: Color(0xff4C748B)),
        ),
      ],
    );
  }
} 