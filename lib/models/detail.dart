class Detail {
  final String step;
  final String ingredient;
  final String video;

  Detail(
    {this.step, 
    this.ingredient, 
    this.video});

  factory Detail.fromJson(dynamic json) {
    return Detail(
        ingredient: json['ingredientLines'][0]['ingredient'] as String,
        step: json['preparationSteps'][0] as String,
        video: json['videos']['videoUrls']['android'] as String);
  }

  static List<Detail> detailsFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return Detail.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return 'Detail {step: $step, ingredient: $ingredient, video: $video}';
  }
}