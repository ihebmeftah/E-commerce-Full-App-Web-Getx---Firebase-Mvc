import 'package:ecommerceapp/view/screens/categoryscreen.dart';
import 'package:ecommerceapp/view/screens/favorites.dart';
import 'package:ecommerceapp/view/screens/home.dart';
import 'package:ecommerceapp/view/screens/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt currentindex = 0.obs;
  final RxList<Widget> tabs = [
    const HomeScreen(),
    const CategoryScreen(),
    const FavoritesScreen(),
    const SettingsScreen()
  ].obs;

  final title = ['Iheb Shop','Categories','Favorites','Settings'].obs;
}
