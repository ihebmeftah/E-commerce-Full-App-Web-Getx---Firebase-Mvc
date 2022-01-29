import 'package:ecommerceapp/models/productmodels.dart';
import 'package:ecommerceapp/services/productservices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductControllers extends GetxController {
  var productList = <ProductModels>[].obs;
  var favProductList = <ProductModels>[].obs;
  var searchList = <ProductModels>[].obs;
  var isLoading = true.obs;
  var isFavorite = false.obs;
  var storage = GetStorage();

  final TextEditingController searchValue = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    List? storedShoppings = storage.read<List>('isfavoriteslist');

    if (storedShoppings != null) {
      favProductList =
          storedShoppings.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
    getPorducts();
  }

  void getPorducts() async {
    var products = await ProductServices.getProduct();
    try {
      isLoading.value = true;
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading.value = false;
    }
  }

  void mangFav(int productId) async {
    var existingINDEX =
        favProductList.indexWhere((element) => element.id == productId);

    if (existingINDEX >= 0) {
      favProductList.removeAt(existingINDEX);
      await storage.remove("isfavoriteslist");
    } else {
      favProductList
          .add(productList.firstWhere((element) => element.id == productId));
      await storage.write("isfavoriteslist", favProductList);
    }
  }

  bool isFav(int productId) {
    return favProductList.any((element) => element.id == productId);
  }

  void addSearchtolist(String value) {
    searchList.value = productList.where((search) {
      return search.title.toLowerCase().contains(value.toLowerCase()) ||
          search.price.toString().toLowerCase().contains(value.toLowerCase());
    }).toList();
    update();
  }

  void clearSearchtolist() {
    searchValue.clear();
    addSearchtolist('');
  }
}
