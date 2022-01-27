import 'package:flutter/material.dart';
// import 'package:resep_makanan2/models/detail.api.dart';
// import 'package:resep_makanan2/models/detail.dart';
import 'package:resep_makanan2/models/recipe.api.dart';
import 'package:resep_makanan2/models/recipe.dart';
import 'package:resep_makanan2/views/widgets/detail_view.dart';

class DetailPage extends StatefulWidget{
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<Recipe> _details;
  bool _isLoading = true;

  @override
  void initState(){
    super.initState();
    getDetails();
  }

  Future<void> getDetails() async {
    _details = await RecipeApi.getRecipe();
    setState(() {
      _isLoading = false;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Recipe')),
          // title: Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Icon(Icons.restaurant_menu),
          //     SizedBox(width: 10),
          //     Text('Food Recipe')
          //   ],
          // ),
        // ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Builder(
                // itemCount: 1,
                builder: (BuildContext context) {
                  return DetailView(
                      title: _details[0].name,
                      step: _details[0].step,
                      ingredient1: _details[0].ingredient1,
                      ingredient2: _details[0].ingredient2,
                      ingredient3: _details[0].ingredient3,
                      ingredient4: _details[0].ingredient4,
                      thumbnailUrl: _details[0].images);
                },
              )
            );
  }
}