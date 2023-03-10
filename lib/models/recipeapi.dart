import 'dart:convert';
import 'package:rapid_api/secrete_apikey.dart';
import 'package:http/http.dart' as http;
import 'package:rapid_api/models/recipe.dart';

class RecipeApiClass {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.parse("https://yummly2.p.rapidapi.com/feeds/list");

    // var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list', {'limit': '24', 'start': '0'});
    final response = await http.get(uri, headers: {
      "X-RapidAPI-Key": apiKey,
      "X-RapidAPI-Host": "yummly2.p.rapidapi.com",
      "useQueryString": "true"
    });

    Map data;
    if (response.body.isNotEmpty) {
      data = json.decode(response.body);
    }
    List _temp = [];

    // print(data['feed'].length);
    for (var i in data['feed']) {
      if (i["content"]["details"] != null && i["content"] != null) {
        _temp.add(i['content']['details']);
      }
    }
    // print(_temp.length);
    return Recipe.recipeFromSnapshot(_temp);
  }
}
