import 'package:ecommerceapp/logic/controllers/authcontroller.dart';
import 'package:ecommerceapp/utils/theme.dart';
import 'package:ecommerceapp/view/widgets/textutils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget({Key? key}) : super(key: key);

  final controller = Get.find<Authcontroller>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<Authcontroller>(builder: (_) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.check();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10)),
              child: controller.ischecked
                  ? Get.isDarkMode
                      ? const Icon(
                          Icons.done,
                          size: 30,
                          color: Colors.greenAccent,
                        )
                      : const Icon(
                          Icons.done,
                          size: 30,
                          color: pinkClr,
                        )
                  : Container(),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              TextUtils(
                  clr: Get.isDarkMode ? Colors.black : Colors.white,
                  txt: 'I accept ',
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
              Text(
                'terms & conditions',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Get.isDarkMode ? Colors.black : Colors.white,
                    decoration: TextDecoration.underline),
              )
            ],
          )
        ],
      );
    });
  }
}
