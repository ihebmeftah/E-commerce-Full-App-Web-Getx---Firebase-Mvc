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
  ];
}

class Routes {
  static const welcome = '/welcomeScreen';
}
