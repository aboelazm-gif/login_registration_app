// To parse this JSON data, do
//
//     final meals = mealsFromJson(jsonString);

import 'dart:convert';

FullRecipe fullRecipeFromJson(String str) =>
    FullRecipe.fromJson(json.decode(str));

String fullRecipeToJson(FullRecipe data) => json.encode(data.toJson());

class FullRecipe {
  List<Map<String, String?>> meals;

  FullRecipe({
    required this.meals,
  });

  factory FullRecipe.fromJson(Map<String, dynamic> json) => FullRecipe(
        meals: List<Map<String, String?>>.from(json["meals"].map(
            (x) => Map.from(x).map((k, v) => MapEntry<String, String?>(k, v)))),
      );

  Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals.map(
            (x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v)))),
      };
}
