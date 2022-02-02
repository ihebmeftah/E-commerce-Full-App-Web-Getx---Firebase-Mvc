import 'package:ecommerceapp/logic/controllers/maincontroller.dart';
import 'package:ecommerceapp/logic/controllers/paycontroller.dart';
import 'package:get/get.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Get.put(MainController()));
    Get.put(PayMentController(), permanent: true);
  }
}
