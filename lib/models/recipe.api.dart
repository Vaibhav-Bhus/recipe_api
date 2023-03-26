import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipe_api/models/recipe.dart';

class RecipeApi {
  static Future<List<Recipe>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "24", "start": "0", "tag": "list.recipe.popular"});

    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': '39a4985c09msha3c468812819143p1ddaf5jsnb80ad939ce3a',
      'X-RapidAPI-Host': 'yummly2.p.rapidapi.com',
      "useQueryString": "true"
    });

    Map data = jsonDecode(response.body);
    List _temp = [];
    print(data);
    for (var i in data['feed']) {
      _temp.add(i['content']['details']);
    }

    return Recipe.recipesFromSnapshot(_temp);
  }
}
