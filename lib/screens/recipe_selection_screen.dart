import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/screens/recipe_detail_screen.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
          ),
          Text("Coffee Recipes",
              style: TextStyle(
                  color: Color(0xff4C748B),
                  fontFamily: 'kollektif',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              key: Key("coffee-recipes")),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff4C748B), width: 3),
              borderRadius: BorderRadius.circular(20.0),
            ),
            margin: EdgeInsets.all(20.0),
            child: RecipeList(),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
          ),
          Text(
            "Resources",
            style: TextStyle(
                color: Color(0xff4C748B),
                fontFamily: 'kollektif',
                fontSize: 24,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff4C748B), width: 3),
                borderRadius: BorderRadius.circular(20.0),
              ),
              margin: EdgeInsets.all(20.0),
              child: ResourceList())
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
                title: Text(recipe.name,
                    style: TextStyle(
                        color: Color(0xff4C748B),
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
                trailing: Icon(Icons.chevron_right, color: Color(0xff4C748B)),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RecipeDetailScreen(recipe)),
                  );
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
  // Function to launch the URL
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => _launchURL('https://www.amazon.com/coffee/s?k=coffee'),
          child: ListTile(
            title: Text(
              "Coffee",
              style: TextStyle(
                color: Color(0xff4C748B),
                fontFamily: 'Montserrat',
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Icon(Icons.chevron_right, color: Color(0xff4C748B)),
          ),
        ),
        Divider(
          color: Color(0xff4C748B),
          thickness: 1,
        ),
        InkWell(
          onTap: () => _launchURL('https://www.amazon.com/Hamilton-Beach-Coffee-Grinder-80335R/dp/B005EPRFKO/ref=sr_1_5?crid=10AB6UHECFK1D&keywords=coffee%2Bgrinder&qid=1702001419&sprefix=coffee%2Bgrinde%2Caps%2C168&sr=8-5&th=1'),
          child: ListTile(
            title: Text(
              "Grinders",
              style: TextStyle(
                color: Color(0xff4C748B),
                fontFamily: 'Montserrat',
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Icon(Icons.chevron_right, color: Color(0xff4C748B)),
          ),
        ),
        Divider(
          color: Color(0xff4C748B),
          thickness: 1,
        ),
        InkWell(
          onTap: () => _launchURL('https://www.amazon.com/Bodum-Gooseneck-Electric-Water-Kettle/dp/B07G2MBM6L/ref=sr_1_5?crid=2BXYCVE53HZ12&keywords=coffee+kettle&qid=1702001438&sprefix=coffee+kettl%2Caps%2C128&sr=8-5'),
          child: ListTile(
            title: Text(
              "Kettles",
              style: TextStyle(
                color: Color(0xff4C748B),
                fontFamily: 'Montserrat',
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Icon(Icons.chevron_right, color: Color(0xff4C748B)),
          ),
        ),
        Divider(
          color: Color(0xff4C748B),
          thickness: 1,
        ),
        InkWell(
          onTap: () => _launchURL('https://www.amazon.com/COSORI-Pour-Over-Resistance-Transparent/dp/B0821DTMGT/ref=sr_1_7?crid=371BO3CQWFZB1&keywords=coffee+dripper&qid=1702001480&sprefix=coffee+drippe%2Caps%2C125&sr=8-7'),
          child: ListTile(
            title: Text(
              "Homebrew Dripper",
              style: TextStyle(
                color: Color(0xff4C748B),
                fontFamily: 'Montserrat',
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Icon(Icons.chevron_right, color: Color(0xff4C748B)),
          ),
        ),
      ],
    );
  }
}
