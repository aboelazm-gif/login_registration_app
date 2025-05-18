import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_registration_app/components/_appBar.dart';
import 'package:login_registration_app/models/_recipes.dart';
import 'package:login_registration_app/models/_recipesServices.dart';
import 'package:login_registration_app/themes/_appTheme1.dart';

class FullRecipePage extends StatefulWidget {
  final String mealId;
  const FullRecipePage({required this.mealId, super.key});

  @override
  State<FullRecipePage> createState() => _FullRecipePageState();
}

class _FullRecipePageState extends State<FullRecipePage>
    with TickerProviderStateMixin {
  FullRecipe? _fullRecipe;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    _fullRecipe = await FullRecipeRemoteService().getMeals(widget.mealId);
    if (_fullRecipe != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "MealTime"),
      body: AnimatedBackground(
        behaviour: particleBehaviour,
        vsync: this,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                width: MediaQuery.of(context).size.width,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.8),
                      offset: Offset(
                        0.0,
                        12.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: -6.0,
                    ),
                  ],
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.35),
                      BlendMode.multiply,
                    ),
                    image: NetworkImage(
                        _fullRecipe?.meals.first["strMealThumb"] ?? ""),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(
                          _fullRecipe?.meals.first["strMeal"] ?? "",
                          style: TextStyle(
                            fontFamily: 'Bukhari',
                            color: Colors.white,
                            fontSize: 30,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.flag_circle_rounded,
                                  color: appBarTitle,
                                  size: 18,
                                ),
                                SizedBox(width: 7),
                                Text(
                                  _fullRecipe?.meals.first["strArea"] ?? "",
                                  style: GoogleFonts.cairo(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: appBarTitle),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.restaurant_rounded,
                                  color: appBarTitle,
                                  size: 18,
                                ),
                                SizedBox(width: 7),
                                Text(
                                  _fullRecipe?.meals.first["strCategory"] ?? "",
                                  style: GoogleFonts.cairo(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: appBarTitle),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 175,
                decoration: BoxDecoration(
                  color: appBarBG,
                  border: Border(
                    top: BorderSide(color: bubbleColor, width: 4),
                    bottom: BorderSide(color: bubbleColor, width: 4),
                    right: BorderSide(color: bubbleColor, width: 4),
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, top: 10.0, bottom: 10.0),
                  child: Text("Ingredients :",
                      style: TextStyle(
                          fontFamily: 'Bukhari',
                          fontSize: 25,
                          color: commonTextColor)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(20, (index) {
                    final ingredient =
                        _fullRecipe?.meals.first["strIngredient${index + 1}"] ??
                            "";
                    final measure =
                        _fullRecipe?.meals.first["strMeasure${index + 1}"] ??
                            "";
                    if (ingredient.trim().isEmpty)
                      return SizedBox.shrink(); // Hide empty
                    return Row(
                      children: [
                        Text([index + 1].toString() + ". ",
                            style: GoogleFonts.cairo(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: commonTextColor,
                            )),
                        Text(
                          "$measure ",
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: commonTextColor,
                          ),
                        ),
                        Text(
                          ingredient,
                          style: GoogleFonts.cairo(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: commonTextColor,
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 175,
                    decoration: BoxDecoration(
                      color: appBarBG,
                      border: Border(
                        top: BorderSide(color: bubbleColor, width: 4),
                        bottom: BorderSide(color: bubbleColor, width: 4),
                        right: BorderSide(color: bubbleColor, width: 4),
                      ),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10.0, top: 10.0, bottom: 10.0),
                      child: Text("Steps :",
                          style: TextStyle(
                              fontFamily: 'Bukhari',
                              fontSize: 25,
                              color: commonTextColor)),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Text(
                        _fullRecipe?.meals.first["strInstructions"] ?? "",
                        style: GoogleFonts.cairo(
                            fontSize: 18,
                            color: commonTextColor,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: appBGColor,
    );
  }
}
