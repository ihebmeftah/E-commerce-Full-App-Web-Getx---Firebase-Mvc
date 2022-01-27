import 'package:ecommerceapp/models/productmodels.dart';
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
    productMap.clear();
  }
}
