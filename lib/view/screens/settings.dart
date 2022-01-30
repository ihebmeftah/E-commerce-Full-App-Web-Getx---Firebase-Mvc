import 'package:ecommerceapp/logic/controllers/authcontroller.dart';
import 'package:ecommerceapp/logic/controllers/themecontroller.dart';
import 'package:ecommerceapp/utils/theme.dart';
import 'package:ecommerceapp/view/widgets/textutils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  final ctrl = Get.find<Authcontroller>();
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: GetBuilder<Authcontroller>(
        builder: (_) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: Get.isDarkMode ? mainColor : darkGreyClr),
              accountName: const Text(
                'Iheb',
                style: TextStyle(color: Colors.white),
              ),
              accountEmail: const Text(
                'Salimbb041@gmail.com',
                style: TextStyle(color: Colors.white),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://scontent.ftun14-1.fna.fbcdn.net/v/t39.30808-6/271835221_2107761069387487_38994193053956026_n.jpg?_nc_cat=107&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=a2z-gZralVUAX_qeWn5&_nc_ht=scontent.ftun14-1.fna&oh=00_AT9ituZftSTkPZ2AbiHJuL_Dur8us-ki77cwW9-Tgbn4Gw&oe=61FB309F'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(
                      clr: Get.isDarkMode ? mainColor : pinkClr,
                      txt: 'GENERAL',
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: Text(
                      'Dark mode',
                      style: TextStyle(
                          color: Get.isDarkMode ? Colors.black : Colors.white,
                          fontSize: 25),
                    ),
                    leading: const CircleAvatar(
                      backgroundColor: darkSettings,
                      child: Icon(
                        Icons.dark_mode,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                    trailing: Switch(
                      value: isSwitched,
                      onChanged: (bool val) {
                        isSwitched = val;
                        ThemeControle().changeTheme();
                      },
                      activeColor: Get.isDarkMode ? mainColor : pinkClr,
                    ),
                    onTap: () {
                      isSwitched = !isSwitched;
                      ThemeControle().changeTheme();
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: Text(
                      'Language',
                      style: TextStyle(
                          color: Get.isDarkMode ? Colors.black : Colors.white,
                          fontSize: 25),
                    ),
                    leading: const CircleAvatar(
                      backgroundColor: languageSettings,
                      child: Icon(
                        Icons.language,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: Text(
                      'Logout',
                      style: TextStyle(
                          color: Get.isDarkMode ? Colors.black : Colors.white,
                          fontSize: 25),
                    ),
                    leading: const CircleAvatar(
                      backgroundColor: logOutSettings,
                      child: Icon(
                        Icons.logout_rounded,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      Get.defaultDialog(
                        title: "Logout ",
                        titleStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        middleText: 'Are you sure ?',
                        middleTextStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        backgroundColor: Colors.white,
                        radius: 10,
                        textCancel: " No ",
                        cancelTextColor: Colors.red,
                        textConfirm: " YES ",
                        confirmTextColor: Colors.white,
                        onCancel: () {
                          Get.back();
                        },
                        onConfirm: () {
                          ctrl.logOutFireBase();
                        },
                        buttonColor: !Get.isDarkMode ? pinkClr : mainColor,
                      );
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
