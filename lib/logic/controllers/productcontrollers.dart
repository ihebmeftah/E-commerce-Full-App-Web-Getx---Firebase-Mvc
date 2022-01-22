import 'package:ecommerceapp/models/productmodels.dart';
import 'package:ecommerceapp/services/productservices.dart';
import 'package:get/get.dart';

class ProductControllers extends GetxController {
  var productList = <ProductModels>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
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
}
