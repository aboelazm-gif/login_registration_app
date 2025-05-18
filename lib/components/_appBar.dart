import 'package:flutter/material.dart';
import 'package:login_registration_app/themes/_appTheme1.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBarWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          Icon(Icons.restaurant_menu, size: 40, color: appBarTitle),
          SizedBox(width: 10),
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Bukhari',
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: appBarTitle,
            ),
          ),
        ],
      ),
      backgroundColor: appBarBG,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
