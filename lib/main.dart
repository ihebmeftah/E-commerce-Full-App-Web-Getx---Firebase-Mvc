import 'package:ecommerceapp/logic/controllers/themecontroller.dart';
import 'package:ecommerceapp/routes/routes.dart';
import 'package:ecommerceapp/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'logic/bindings/productbindings.dart';

void main() async {
  ProductBinding().dependencies();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ecommerce',
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeControle().ThemeDataGet,
      debugShowCheckedModeBanner: false,
      initialRoute: FirebaseAuth.instance.currentUser != null ||
              GetStorage().read<bool>('auth') == true
          ? Approutes.mainscreen
          : Approutes.welcome,
      getPages: Approutes.routes,
    );
  }
}
