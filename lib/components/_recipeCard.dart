import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:login_registration_app/screens/_fullRecipePage.dart';
import 'package:login_registration_app/themes/_appTheme1.dart';

class RecipeCard extends StatelessWidget {
  final String title;
  final String thumbnailUrl;
  final String mealId;
  RecipeCard({
    required this.title,
    required this.mealId,
    required this.thumbnailUrl,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FullRecipePage(
              mealId: mealId,
            ),
          )),
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
            image: NetworkImage(thumbnailUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
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
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AutoSizeText(
                    title,
                    style: GoogleFonts.cairo(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
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
