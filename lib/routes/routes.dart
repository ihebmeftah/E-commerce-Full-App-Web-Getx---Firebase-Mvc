import 'package:ecommerceapp/logic/bindings/authbindings.dart';
import 'package:ecommerceapp/logic/bindings/mainbinfings.dart';
import 'package:ecommerceapp/logic/bindings/productbindings.dart';
import 'package:ecommerceapp/view/pannierscreen.dart';
import 'package:ecommerceapp/view/screens/auth/forgotpassword.dart';
import 'package:ecommerceapp/view/screens/auth/login.dart';
import 'package:ecommerceapp/view/screens/auth/signup.dart';
import 'package:ecommerceapp/view/screens/mainscreen.dart';
import 'package:ecommerceapp/view/screens/welcomescreen.dart';
import 'package:get/get.dart';

class Approutes {
  //initialRoute
  static const welcome = Routes.welcome;
  static const mainscreen = Routes.mainScreen;

  //getPages

  static final routes = [
    GetPage(
      name: Routes.welcome,
      page: () => const Welcomescreen(),
    ),
    GetPage(
      name: Routes.signUpSCreen,
      page: () => SignupScreen(),
      binding: Authbindings(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: Authbindings(),
    ),
    GetPage(
      name: Routes.forgotPasswordScreen,
      page: () => ForgotpasswordScreen(),
      binding: Authbindings(),
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => Mainscreen(),
      bindings: [Authbindings(), MainBindings(), ProductBinding()],
    ),
    GetPage(
      name: Routes.pannierScreen,
      page: () => const PannierScreen(),
    ),
  ];
}

class Routes {
  static const welcome = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpSCreen = '/signUpSCreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';
  static const mainScreen = '/mainScreen';
  static const pannierScreen = '/pannierScreen';
}
