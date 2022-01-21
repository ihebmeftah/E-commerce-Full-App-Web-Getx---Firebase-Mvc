import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Text(
          'CategoryScreen',
          style:
              TextStyle(color: !Get.isDarkMode ? Colors.white : Colors.black),
        ),
      ),
    ));
  }
}
