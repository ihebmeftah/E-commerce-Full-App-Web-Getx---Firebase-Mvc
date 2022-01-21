import 'package:ecommerceapp/logic/controllers/authcontroller.dart';
import 'package:ecommerceapp/logic/controllers/themecontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  final controller = Get.find<Authcontroller>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  ThemeControle().changeTheme();
                },
                child: Text(
                  'Change theme',
                  style: TextStyle(
                      color: !Get.isDarkMode ? Colors.white : Colors.black),
                )),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<Authcontroller>(
                builder: (_) => TextButton(
                      onPressed: () {
                        controller.logOutFireBase();
                      },
                      child: Text(
                        'Logout',
                        style: TextStyle(
                            color:
                                !Get.isDarkMode ? Colors.white : Colors.black),
                      ),
                    ))
          ],
        ),
      ),
    ));
  }
}
