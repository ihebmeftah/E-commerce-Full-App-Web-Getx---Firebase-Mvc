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
            Obx(() {
              return UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    color: Get.isDarkMode ? mainColor : darkGreyClr),
                accountName: Text(
                  ctrl.displayUserName.value,
                  style: const TextStyle(color: Colors.white),
                ),
                accountEmail: Text(
                  ctrl.displayUserMail.value,
                  style: const TextStyle(color: Colors.white),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(ctrl.displayUserPhoto.value),
                ),
              );
            }),
            Obx(() {
              return Padding(
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
                    Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            title: Text(
                              'Language',
                              style: TextStyle(
                                  color: Get.isDarkMode
                                      ? Colors.black
                                      : Colors.white,
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
                            onTap: () {},
                          ),
                        ),
                        DropdownButton<String>(
                          dropdownColor: Get.isDarkMode ? mainColor : pinkClr,
                          value: ctrl.dropdownValue.value,
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Get.isDarkMode ? Colors.black : Colors.white,
                          ),
                          style: TextStyle(
                              color:
                                  Get.isDarkMode ? Colors.black : Colors.white),
                          underline: Container(
                            color: Get.isDarkMode ? mainColor : pinkClr,
                            height: 2,
                          ),
                          onChanged: (String? newValue) {
                            ctrl.dropdownValue.value = newValue!;
                          },
                          items: <String>['One', 'Two', 'Free', 'Four']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        )
                      ],
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
              );
            })
          ],
        ),
      ),
    ));
  }
}
