import 'package:ecommerceapp/logic/controllers/categorycontroller.dart';
import 'package:ecommerceapp/logic/controllers/panniercontroller.dart';
import 'package:ecommerceapp/logic/controllers/productcontrollers.dart';
import 'package:get/get.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductControllers());
    Get.put(CategoryControlle());
    Get.lazyPut(() => PannierController());
  }
}
