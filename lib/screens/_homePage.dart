import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_registration_app/components/_appBar.dart';
import 'package:login_registration_app/components/_categoryCard.dart';
import 'package:login_registration_app/models/_categories.dart';
import 'package:login_registration_app/models/_categoriesServices.dart';
import 'package:login_registration_app/themes/_appTheme1.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Categories? _categories;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    _categories = await CategoriesRemoteService().getCategories();
    if (_categories != null) {
      setState(
        () {
          isLoaded = true;
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: "Welcome"),
      body: AnimatedBackground(
        vsync: this,
        behaviour: particleBehaviour,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  "Choose a category:",
                  style: GoogleFonts.cairo(
                      color: commonTextColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Visibility(
                  visible: isLoaded,
                  replacement: Center(
                    child: CircularProgressIndicator(
                      color: commonTextColor,
                    ),
                  ),
                  child: ListView.builder(
                    itemCount: _categories?.categories.length,
                    itemBuilder: (context, index) {
                      return CategoryCard(
                        categoryDesc: _categories
                                ?.categories[index].strCategoryDescription ??
                            'No Description',
                        categoryTitle:
                            _categories?.categories[index].strCategory ??
                                'No Category',
                        categoryThumbnailUrl: _categories
                                ?.categories[index].strCategoryThumb ??
                            'https://artsmidnorthcoast.com/wp-content/uploads/2014/05/no-image-available-icon-6-300x188.png',
                      );
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: appBGColor,
    );
  }
}
