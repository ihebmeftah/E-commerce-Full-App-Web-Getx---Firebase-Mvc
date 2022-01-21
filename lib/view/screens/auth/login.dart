// ignore_for_file: must_be_immutable

import 'package:ecommerceapp/logic/controllers/authcontroller.dart';
import 'package:ecommerceapp/routes/routes.dart';
import 'package:ecommerceapp/utils/my_string.dart';
import 'package:ecommerceapp/utils/theme.dart';
import 'package:ecommerceapp/view/widgets/authbutton.dart';
import 'package:ecommerceapp/view/widgets/authfields.dart';
import 'package:ecommerceapp/view/widgets/bottomcontainer.dart';
import 'package:ecommerceapp/view/widgets/textutils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController emailCntrl = TextEditingController();
  TextEditingController passCntrl = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  final controller = Get.find<Authcontroller>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
        appBar: AppBar(
          backgroundColor: Get.isDarkMode ? Colors.white : darkGreyClr,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 25,
                    right: 25,
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                                clr: Get.isDarkMode ? mainColor : pinkClr,
                                txt: 'LOG',
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                            const SizedBox(
                              width: 5,
                            ),
                            TextUtils(
                                clr: Get.isDarkMode
                                    ? Colors.black
                                    : Colors.white,
                                txt: 'IN',
                                fontSize: 28,
                                fontWeight: FontWeight.w500),
                          ],
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
                          height: 20,
                        ),
                        GetBuilder<Authcontroller>(builder: (_) {
                          return AuthFields(
                            cntrl: passCntrl,
                            isPass: controller.isVisible ? false : true,
                            validate: (value) {
                              if (value.toString().length <= 8) {
                                return 'Enter valid password';
                              } else {
                                return null;
                              }
                            },
                            pIcon: Get.isDarkMode
                                ? const Icon(
                                    Icons.lock,
                                    size: 30,
                                    color: Colors.greenAccent,
                                  )
                                : const Icon(
                                    Icons.lock,
                                    size: 30,
                                    color: pinkClr,
                                  ),
                            sIcon: InkWell(
                              onTap: () {
                                controller.visibile();
                              },
                              child: controller.isVisible
                                  ? const Icon(
                                      Icons.visibility_off,
                                      color: Colors.black,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      color: Colors.black,
                                    ),
                            ),
                            hText: 'Password',
                          );
                        }),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {
                                Get.toNamed(Routes.forgotPasswordScreen);
                              },
                              child: TextUtils(
                                  clr: Get.isDarkMode
                                      ? Colors.black
                                      : Colors.white,
                                  txt: 'Forgot password ?',
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GetBuilder<Authcontroller>(
                          builder: (_) {
                            return AuthButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  controller.loginFireBase(
                                      email: emailCntrl.text.trim(),
                                      password: passCntrl.text.trim());
                                }
                              },
                              txt: 'Log In',
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextUtils(
                            clr: Get.isDarkMode ? Colors.black : Colors.white,
                            txt: 'OR',
                            fontSize: 24,
                            fontWeight: FontWeight.w300),
                        const SizedBox(
                          height: 20,
                        ),
                        GetBuilder<Authcontroller>(
                          builder: (_) {
                            return Center(
                                child: IconButton(
                                    iconSize: 20,
                                    icon: Center(
                                      child: FaIcon(
                                        FontAwesomeIcons.google,
                                        color: Get.isDarkMode
                                            ? Colors.green
                                            : Colors.white,
                                        size: 40,
                                      ),
                                    ),
                                    onPressed: () {
                                      controller.googlesignUpFireBase();
                                    }));
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
              BottomContainer(
                onPress: () {
                  Get.offNamed(Routes.signUpSCreen);
                },
                txt: "Don't have an Account? ",
                txt2: 'Sign Up',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
