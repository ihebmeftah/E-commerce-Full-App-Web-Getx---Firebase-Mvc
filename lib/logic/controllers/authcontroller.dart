import 'package:get/get.dart';

class Authcontroller extends GetxController {
  bool isVisible = false;
  bool ischecked = false;
  void visibile() {
    isVisible = !isVisible;
    update();
  }

  void check() {
    ischecked = !ischecked;
    update();
  }
}
