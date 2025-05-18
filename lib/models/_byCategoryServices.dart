import 'package:login_registration_app/models/_byCategory.dart';
import 'package:http/http.dart' as http;

class ByCategoryRemoteService {
  Future<ByCategory?> getByCategory(String cat) async {
    var client = http.Client();
    var uri =
        Uri.parse("https://www.themealdb.com/api/json/v1/1/filter.php?c=$cat");
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return byCategoryFromJson(json);
    } else {
      return null;
    }
  }
}
