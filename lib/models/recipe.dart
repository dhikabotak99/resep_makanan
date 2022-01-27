class Recipe {
  final String name;
  final String images;
  final double rating;
  final String totalTime;
  final String step;
  final String ingredient1;
  final String ingredient2;
  final String ingredient3;
  final String ingredient4;
  final String video;

  Recipe(
    {this.name, 
    this.images, 
    this.rating, 
    this.totalTime,
    this.step, 
    this.ingredient1, 
    this.ingredient2, 
    this.ingredient3, 
    this.ingredient4, 
    this.video});

  factory Recipe.fromJson(dynamic json) {
    return Recipe(
        name: json['details']['name'] as String,
        images: json['details']['images'][0]['hostedLargeUrl'] as String,
        rating: json['details']['rating'] as double,
        totalTime: json['details']['totalTime'] as String,
        ingredient1: json['ingredientLines'][0]['ingredient'] as String,
        ingredient2: json['ingredientLines'][1]['ingredient'] as String,
        ingredient3: json['ingredientLines'][2]['ingredient'] as String,
        ingredient4: json['ingredientLines'][3]['ingredient'] as String,
        step: json['preparationSteps'][0] as String);
  }

  static List<Recipe> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Recipe {name: $name, image: $images, rating: $rating, totalTime: $totalTime, step: $step, ingredient1: $ingredient1, ingredient2: $ingredient2, ingredient3: $ingredient3, ingredient4: $ingredient4}';
  }
}