import 'package:ecommerceapp/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ecommerce',
      debugShowCheckedModeBanner: false,
      initialRoute: Approutes.welcome,
      getPages: Approutes.routes,
    );
  }
}
