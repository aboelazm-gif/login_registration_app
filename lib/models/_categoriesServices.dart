import 'package:login_registration_app/models/_categories.dart';
import 'package:http/http.dart' as http;

class CategoriesRemoteService {
  Future<Categories?> getCategories() async {
    var client = http.Client();
    var uri =
        Uri.parse("https://www.themealdb.com/api/json/v1/1/categories.php");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return categoriesFromJson(json);
    } else {
      return null;
    }
  }
}
