import 'package:login_registration_app/models/_recipes.dart';
import 'package:http/http.dart' as http;

class FullRecipeRemoteService {
  Future<FullRecipe?> getMeals(String MealId) async {
    var client = http.Client();
    var uri = Uri.parse(
        "https://www.themealdb.com/api/json/v1/1/lookup.php?i=$MealId");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return fullRecipeFromJson(json);
    } else {
      return null;
    }
  }
}
