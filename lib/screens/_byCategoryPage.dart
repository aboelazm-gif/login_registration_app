import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_registration_app/components/_appBar.dart';
import 'package:login_registration_app/components/_recipeCard.dart';
import 'package:login_registration_app/models/_byCategory.dart';
import 'package:login_registration_app/models/_byCategoryServices.dart';
import 'package:login_registration_app/themes/_appTheme1.dart';

class ByCategoryPage extends StatefulWidget {
  final String categoryName;
  final String categoryDescription;

  const ByCategoryPage(
      {required this.categoryDescription,
      required this.categoryName,
      super.key});

  @override
  State<ByCategoryPage> createState() => _ByCategoryPageState();
}

class _ByCategoryPageState extends State<ByCategoryPage>
    with TickerProviderStateMixin {
  ByCategory? _byCategory;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    _byCategory =
        await ByCategoryRemoteService().getByCategory(widget.categoryName);
    if (_byCategory != null) {
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
          vsync: this,
          behaviour: particleBehaviour,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(153, 0, 0, 0),
                      offset: Offset(
                        0.0,
                        10.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: -6.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 8.0, bottom: 8.0),
                  child: Text(
                    textAlign: TextAlign.left,
                    widget.categoryName + ":",
                    style: GoogleFonts.cairo(
                        color: commonTextColor,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: Visibility(
                  visible: isLoaded,
                  replacement: Center(
                    child: CircularProgressIndicator(
                      color: commonTextColor,
                    ),
                  ),
                  child: ListView.builder(
                      itemCount: _byCategory?.meals.length,
                      itemBuilder: (context, index) {
                        return RecipeCard(
                          mealId:
                              _byCategory?.meals[index].idMeal ?? 'No ID found',
                          title: _byCategory?.meals[index].strMeal ??
                              'No Category',
                          thumbnailUrl: _byCategory
                                  ?.meals[index].strMealThumb ??
                              'https://artsmidnorthcoast.com/wp-content/uploads/2014/05/no-image-available-icon-6-300x188.png',
                        );
                      }),
                ),
              ),
            ],
          )),
      backgroundColor: appBGColor,
    );
  }
}
