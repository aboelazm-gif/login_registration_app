import 'dart:convert';

ByCategory byCategoryFromJson(String str) =>
    ByCategory.fromJson(json.decode(str));

String byCategoryToJson(ByCategory data) => json.encode(data.toJson());

class ByCategory {
  List<Meal> meals;

  ByCategory({
    required this.meals,
  });

  factory ByCategory.fromJson(Map<String, dynamic> json) => ByCategory(
        meals: List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals.map((x) => x.toJson())),
      };
}

class Meal {
  String strMeal;
  String strMealThumb;
  String idMeal;

  Meal({
    required this.strMeal,
    required this.strMealThumb,
    required this.idMeal,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        strMeal: json["strMeal"],
        strMealThumb: json["strMealThumb"],
        idMeal: json["idMeal"],
      );

  Map<String, dynamic> toJson() => {
        "strMeal": strMeal,
        "strMealThumb": strMealThumb,
        "idMeal": idMeal,
      };
}
