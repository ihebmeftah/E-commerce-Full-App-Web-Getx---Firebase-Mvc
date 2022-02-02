import 'package:ecommerceapp/logic/controllers/panniercontroller.dart';
import 'package:ecommerceapp/models/productmodels.dart';
import 'package:ecommerceapp/utils/theme.dart';
import 'package:ecommerceapp/view/widgets/textutils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddCart extends StatelessWidget {
  AddCart({Key? key, required this.price, required this.prodModel})
      : super(key: key);
  final double price;
  final ProductModels prodModel;
  final cartController = Get.find<PannierController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextUtils(
                  clr: Colors.grey,
                  txt: 'Price',
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              const SizedBox(
                height: 10,
              ),
              TextUtils(
                  clr: Get.isDarkMode ? Colors.black : Colors.white,
                  txt: '\$ $price',
                  fontSize: 20,
                  fontWeight: FontWeight.bold)
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: SizedBox(
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Get.isDarkMode ? mainColor : pinkClr,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              onPressed: () {
                try {
                  cartController.addproductTopannier(prodModel);

                  Get.snackbar('Successfully ', 'Add to your cart successfully',
                      backgroundColor: Get.isDarkMode ? mainColor : pinkClr,
                      colorText: Colors.white,
                      duration: const Duration(seconds: 1),
                      snackPosition: SnackPosition.BOTTOM,
                      margin: const EdgeInsets.all(10));
                } catch (e) {
                  Get.snackbar(
                    'Error ',
                    'Error in  add to your cart ',
                    backgroundColor: Colors.redAccent,
                    colorText: Colors.white,
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextUtils(
                      clr: !Get.isDarkMode ? Colors.black : Colors.white,
                      txt: 'Add to Cart',
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(Icons.shopping_cart_outlined)
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
