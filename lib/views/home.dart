import 'package:flutter/material.dart';
import 'package:resep_makanan2/models/recipe.api.dart';
import 'package:resep_makanan2/models/recipe.dart';
import 'package:resep_makanan2/views/widgets/recipe_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.food_bank_outlined),
              SizedBox(width: 10),
              Text('Rumah Resep')
            ],
          ),
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView(
              children: [
                SizedBox(
                  height: 5,
                ),
                Container(
                  color: Colors.lightBlue,
                  width: 10,
                  height: 25,
                  child: Text(
                    " Recommended Recipe",
                    style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )
                ),
                Container(
                  height: 180,
                  width: 500,
                  child: ListView.builder(
                    itemCount: _recipes.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return RecipeCard(
                          title: _recipes[index].name,
                          cookTime: _recipes[index].totalTime,
                          rating: _recipes[index].rating.toString(),
                          thumbnailUrl: _recipes[index].images);
                    },
                  )
                ),
                Container(
                  color: Colors.lightBlue,
                  width: 10,
                  height: 25,
                  child: Text(
                    " Top Searched Recipe",
                    style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )
                ),
                Container(
                  height: 200,
                  width: 500,
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return RecipeCard(
                          title: _recipes[12].name,
                          cookTime: _recipes[12].totalTime,
                          rating: _recipes[12].rating.toString(),
                          thumbnailUrl: _recipes[12].images);
                    },
                  )
                ),
              ]
            )
          );
  }
}