import 'package:ecommerceapp/view/screens/auth/login.dart';
import 'package:ecommerceapp/view/screens/auth/signup.dart';
import 'package:ecommerceapp/view/screens/welcomescreen.dart';
import 'package:get/get.dart';

class Approutes {
  //initialRoute

  static const welcome = Routes.welcome;
  //getPages

  static final routes = [
    GetPage(
      name: Routes.welcome,
      page: () => const Welcomescreen(),
    ),
    GetPage(
      name: Routes.signUpSCreen,
      page: () => const SignupScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => const LoginScreen(),
    ),
  ];
}

class Routes {
  static const welcome = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpSCreen = '/signUpSCreen';
}
