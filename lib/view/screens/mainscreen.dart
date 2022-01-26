// ignore_for_file: invalid_use_of_protected_member

import 'package:ecommerceapp/logic/controllers/maincontroller.dart';
import 'package:ecommerceapp/routes/routes.dart';
import 'package:ecommerceapp/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Mainscreen extends StatelessWidget {
  Mainscreen({Key? key}) : super(key: key);
  final controller = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SafeArea(
          child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed(Routes.pannierScreen);
                },
                icon: const FaIcon(FontAwesomeIcons.shoppingBasket))
          ],
          backgroundColor: Get.isDarkMode ? mainColor : darkGreyClr,
          elevation: 0,
          title: Text(controller.title[controller.currentindex.value]),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentindex.value,
          items: [
            BottomNavigationBarItem(
                activeIcon: FaIcon(
                  FontAwesomeIcons.home,
                  color: Get.isDarkMode ? mainColor : pinkClr,
                ),
                icon: FaIcon(
                  FontAwesomeIcons.home,
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                ),
                label: '  '),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.category,
                  color: Get.isDarkMode ? mainColor : pinkClr,
                ),
                icon: Icon(Icons.category,
                    color: Get.isDarkMode ? Colors.black : Colors.white),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.favorite,
                  color: Get.isDarkMode ? mainColor : pinkClr,
                ),
                icon: Icon(Icons.favorite,
                    color: Get.isDarkMode ? Colors.black : Colors.white),
                label: ''),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.settings,
                  color: Get.isDarkMode ? mainColor : pinkClr,
                ),
                icon: Icon(Icons.settings,
                    color: Get.isDarkMode ? Colors.black : Colors.white),
                label: ''),
          ],
          onTap: (index) {
            controller.currentindex.value = index;
          },
        ),
        body: IndexedStack(
          index: controller.currentindex.value,
          children: controller.tabs.value,
        ),
      ));
    });
  }
}
