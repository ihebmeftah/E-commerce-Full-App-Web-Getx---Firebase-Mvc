import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Text(
          'FavoritesScreen',
          style:
              TextStyle(color: !Get.isDarkMode ? Colors.white : Colors.black),
        ),
      ),
    ));
  }
}
