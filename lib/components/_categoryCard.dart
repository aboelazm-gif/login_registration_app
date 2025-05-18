import 'package:flutter/material.dart';
import 'package:login_registration_app/screens/_byCategoryPage.dart';
import 'package:login_registration_app/themes/_appTheme1.dart';

class CategoryCard extends StatelessWidget {
  final String categoryTitle;
  final String categoryThumbnailUrl;
  final String categoryDesc;
  CategoryCard({
    required this.categoryTitle,
    required this.categoryThumbnailUrl,
    required this.categoryDesc,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ByCategoryPage(
                    categoryDescription: categoryDesc,
                    categoryName: categoryTitle,
                  ))),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        width: MediaQuery.of(context).size.width,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(35),
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
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              const Color.fromARGB(100, 0, 0, 0),
              BlendMode.multiply,
            ),
            image: NetworkImage(categoryThumbnailUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: appBarBG,
                      width: 4,
                    ),
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  width: 375,
                  alignment: Alignment.center,
                  height: 100,
                  child: Text(
                    categoryTitle,
                    style: TextStyle(
                      fontFamily: 'Bukhari',
                      color: Colors.black,
                      fontSize: 30,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
