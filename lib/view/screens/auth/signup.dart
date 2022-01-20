// ignore_for_file: must_be_immutable

import 'package:ecommerceapp/logic/controllers/authcontroller.dart';
import 'package:ecommerceapp/routes/routes.dart';
import 'package:ecommerceapp/utils/my_string.dart';
import 'package:ecommerceapp/utils/theme.dart';
import 'package:ecommerceapp/view/widgets/authbutton.dart';
import 'package:ecommerceapp/view/widgets/authfields.dart';
import 'package:ecommerceapp/view/widgets/bottomcontainer.dart';
import 'package:ecommerceapp/view/widgets/checkwidget.dart';
import 'package:ecommerceapp/view/widgets/textutils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey();
  TextEditingController nameCntrl = TextEditingController();
  TextEditingController passCntrl = TextEditingController();
  TextEditingController emailCntrl = TextEditingController();
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
                                txt: 'SIGN',
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                            const SizedBox(
                              width: 5,
                            ),
                            TextUtils(
                                clr: Get.isDarkMode
                                    ? Colors.black
                                    : Colors.white,
                                txt: 'UP',
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        AuthFields(
                          cntrl: nameCntrl,
                          isPass: false,
                          validate: (value) {
                            if (value.toString().length <= 2 ||
                                !RegExp(validationName).hasMatch(value)) {
                              return 'Enter valid name ';
                            } else {
                              return null;
                            }
                          },
                          pIcon: Get.isDarkMode
                              ? const Icon(
                                  Icons.person,
                                  color: Colors.greenAccent,
                                  size: 30,
                                )
                              : const Icon(
                                  Icons.person,
                                  color: pinkClr,
                                  size: 30,
                                ),
                          sIcon: const SizedBox(),
                          hText: 'User Name',
                        ),
                        const SizedBox(
                          height: 20,
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
                        const SizedBox(
                          height: 50,
                        ),
                        CheckWidget(),
                        const SizedBox(
                          height: 40,
                        ),
                        AuthButton(
                          onPressed: () {},
                          txt: 'Sign up',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              BottomContainer(
                onPress: () {
                  Get.offNamed(Routes.loginScreen);
                },
                txt: "Don't have an Account? ",
                txt2: 'Log in',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
