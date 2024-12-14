import 'dart:convert';
import 'recipe.dart';
import 'package:http/http.dart' as http;

class RecipesApi {
  static const String apiKey =
      "e8b8513c2d734c3a81879b6780fd1128"; // Replace with your actual API key
  static const String baseUrl = "api.spoonacular.com";

  static Future<List<Recipe>> getRecipe(String mealType) async {
  var uri = Uri.https(baseUrl, "/recipes/complexSearch", {
    "type": mealType, // Pass the desired category here
    "number": "10",  // Number of results to fetch
    "apiKey": apiKey,
  });

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    Map data = jsonDecode(response.body);
    List _temp = data['results'] ?? [];
    return Recipe.recipesFromSnapshot(_temp);
  } else {
    throw Exception("Failed to fetch $mealType recipes");
  }
}

static Future<Recipe> getRecipeDetails(int recipeId) async {
  var uri = Uri.https(baseUrl, "/recipes/$recipeId/information", {
    "apiKey": apiKey,
  });

  final response = await http.get(uri);

  if (response.statusCode == 200) {
    Map data = jsonDecode(response.body);
    return Recipe.fromJson(data);
  } else {
    throw Exception("Failed to fetch recipe details");
  }
}


}
