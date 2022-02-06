import 'package:ecommerceapp/models/productmodels.dart';
import 'package:ecommerceapp/routes/routes.dart';
import 'package:ecommerceapp/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PannierController extends GetxController {
  var productMap = {}.obs;

  get productPrice =>
      productMap.entries.map((e) => e.key.price * e.value).toList();

  get totalPannier => productMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  void addproductTopannier(ProductModels prodMod) {
    if (productMap.containsKey(prodMod)) {
      productMap[prodMod] += 1;
    } else {
      productMap[prodMod] = 1;
    }
  }

  void removeproductTopannier(ProductModels prodMod) {
    if (productMap.containsKey(prodMod) && productMap[prodMod] == 1) {
      productMap.removeWhere((key, value) => key == prodMod);
    } else {
      productMap[prodMod] -= 1;
    }
  }

  void removeOneProduct(ProductModels prodMod) {
    productMap.removeWhere((key, value) => key == prodMod);
  }

  void clearALL() {
    Get.defaultDialog(
      title: "Clean Products",
      titleStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      middleText: 'Are you sure you need clear products',
      middleTextStyle: const TextStyle(
        fontSize: 15,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor: !Get.isDarkMode ? pinkClr : mainColor,
      radius: 10,
      textCancel: " No ",
      cancelTextColor: Colors.white,
      textConfirm: " YES ",
      confirmTextColor: Colors.white,
      onCancel: () {
        Get.toNamed(Routes.pannierScreen);
      },
      onConfirm: () {
        productMap.clear();
        Get.back();
      },
      buttonColor: !Get.isDarkMode ? pinkClr : mainColor,
    );
  }
}
