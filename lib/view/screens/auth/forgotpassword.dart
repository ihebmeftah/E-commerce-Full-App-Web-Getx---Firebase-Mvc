// ignore_for_file: must_be_immutable

import 'package:ecommerceapp/utils/my_string.dart';
import 'package:ecommerceapp/utils/theme.dart';
import 'package:ecommerceapp/view/widgets/authbutton.dart';
import 'package:ecommerceapp/view/widgets/authfields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotpasswordScreen extends StatelessWidget {
  ForgotpasswordScreen({Key? key}) : super(key: key);
  TextEditingController emailCntrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
      appBar: AppBar(
        backgroundColor: Get.isDarkMode ? Colors.white : Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Forgot Password',
          style: TextStyle(color: Get.isDarkMode ? mainColor : pinkClr),
        ),
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'If you want to recieve your account , then please provide you email ID below..',
                  style: TextStyle(
                    color: Get.isDarkMode ? Colors.black : Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'images/forgetpasscopy.png',
                  width: 200,
                ),
                const SizedBox(
                  height: 50,
                ),
                AuthFields(
                  cntrl: emailCntrl,
                  isPass: false,
                  validate: (value) {
                    if (!RegExp(validationEmail).hasMatch(value)) {
                      return 'Enter valid Email ';
                    } else {
                      return null;
                    }
                  },
                  pIcon: Get.isDarkMode
                      ? const Icon(
                          Icons.mail,
                          size: 30,
                          color: Colors.greenAccent,
                        )
                      : const Icon(
                          Icons.mail,
                          size: 30,
                          color: pinkClr,
                        ),
                  sIcon: const SizedBox(),
                  hText: 'Email',
                ),
                const SizedBox(
                  height: 50,
                ),
                AuthButton(txt: 'SEND', onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
