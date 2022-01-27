import 'dart:convert';
// import 'package:resep_makanan2/models/recipe.dart';
import 'package:resep_makanan2/models/detail.dart';
import 'package:http/http.dart' as http;

class DetailApi {
  static Future<List<Detail>> getDetail() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "x-rapidapi-key": "8c5aa4e91dmsha0efcf3dcebc404p1e968bjsn0c7e952562fb",
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];
    // List id = [];

    for (var i in data['feed']) {
      _temp.add(i['content']);
      // id.add(i);
      // print(_temp.toString());
      // print("Detail API Get");
    }

    return Detail.detailsFromSnapshot(_temp);
  }
}