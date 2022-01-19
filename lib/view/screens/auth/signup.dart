// ignore_for_file: must_be_immutable

import 'package:ecommerceapp/utils/theme.dart';
import 'package:ecommerceapp/view/widgets/authbutton.dart';
import 'package:ecommerceapp/view/widgets/authfields.dart';
import 'package:ecommerceapp/view/widgets/bottomcontainer.dart';
import 'package:ecommerceapp/view/widgets/checkwidget.dart';
import 'package:ecommerceapp/view/widgets/textutils.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  TextEditingController nameCntrl = TextEditingController();
  TextEditingController passCntrl = TextEditingController();
  TextEditingController emailCntrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
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
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          TextUtils(
                              clr: mainColor,
                              txt: 'SIGN',
                              fontSize: 28,
                              fontWeight: FontWeight.bold),
                          SizedBox(
                            width: 5,
                          ),
                          TextUtils(
                              clr: Colors.black,
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
                        validate: () {},
                        pIcon: Image.asset("images/user.png"),
                        sIcon: const SizedBox(),
                        hText: 'User Name',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AuthFields(
                        cntrl: emailCntrl,
                        isPass: false,
                        validate: () {},
                        pIcon: Image.asset("images/email.png"),
                        sIcon: const SizedBox(),
                        hText: 'Email',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AuthFields(
                        cntrl: passCntrl,
                        isPass: true,
                        validate: () {},
                        pIcon: Image.asset("images/lock.png"),
                        sIcon: const SizedBox(),
                        hText: 'Password',
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const CheckWidget(),
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
              BottomContainer(
                onPress: () {},
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
