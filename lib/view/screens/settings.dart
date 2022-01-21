import 'package:ecommerceapp/logic/controllers/themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: TextButton(
            onPressed: () {
              ThemeControle().changeTheme();
            },
            child: Text(
              'Change theme',
              style: TextStyle(
                  color: !Get.isDarkMode ? Colors.white : Colors.black),
            )),
      ),
    ));
  }
}
