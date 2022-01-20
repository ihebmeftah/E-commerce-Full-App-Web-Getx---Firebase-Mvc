import 'package:ecommerceapp/logic/controllers/authcontroller.dart';
import 'package:get/get.dart';

class Authbindings extends Bindings{
  @override
  void dependencies() {
     Get.put(Authcontroller());  }

}