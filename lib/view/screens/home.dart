import 'package:ecommerceapp/utils/theme.dart';
import 'package:ecommerceapp/view/widgets/home/carditems.dart';
import 'package:ecommerceapp/view/widgets/home/searchfield.dart';
import 'package:ecommerceapp/view/widgets/textutils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: context.theme.backgroundColor,
            body: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                      color: Get.isDarkMode ? mainColor : darkGreyClr,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25))),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18, right: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TextUtils(
                            clr: Colors.white,
                            txt: 'Find Your',
                            fontSize: 25,
                            fontWeight: FontWeight.w300),
                        const SizedBox(
                          height: 10,
                        ),
                        const TextUtils(
                            clr: Colors.white,
                            txt: 'INSPIRATION',
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const Expanded(
                              child: SearchFormtext(),
                              flex: 6,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                                child: Icon(
                              Icons.filter_list,
                              size: 45,
                              color: Get.isDarkMode ? Colors.white : pinkClr,
                            ))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0, top: 8),
                    child: TextUtils(
                        clr: !Get.isDarkMode ? Colors.white : Colors.black,
                        txt: 'Categories',
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                 Carditems()
              ],
            )));
  }
}
