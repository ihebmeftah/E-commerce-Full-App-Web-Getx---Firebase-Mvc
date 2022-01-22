import 'package:ecommerceapp/logic/controllers/productcontrollers.dart';
import 'package:ecommerceapp/utils/theme.dart';
import 'package:ecommerceapp/view/widgets/textutils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/animations/bouncing_line.dart';

class Carditems extends StatelessWidget {
  Carditems({Key? key}) : super(key: key);
  final controller = Get.find<ProductControllers>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
            child: LoadingBouncingLine.circle(
          borderColor: Colors.cyan,
          borderSize: 3.0,
          size: 80.0,
          backgroundColor: Get.isDarkMode ? mainColor : pinkClr,
          duration: const Duration(milliseconds: 1500),
        ));
      } else {
        return Expanded(
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.8,
                mainAxisSpacing: 9.0,
                crossAxisCount: 2,
                mainAxisExtent: 210),
            itemCount: controller.productList.length,
            itemBuilder: (BuildContext context, int index) {
              return buildCardItems(
                  img: controller.productList[index].image,
                  price: controller.productList[index].price,
                  rate: controller.productList[index].rating.rate);
            },
          ),
        );
      }
    });
  }

  Widget buildCardItems(
      {required String img, required double price, required double rate}) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 5)
            ]),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.favorite_outline),
                  color: Colors.black,
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_box_outlined),
                  color: Colors.black,
                ),
              ],
            ),
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Stack(children: [
                Center(
                  child: Image.network(
                    img,
                    fit: BoxFit.cover,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 20,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Get.isDarkMode ? mainColor : pinkClr,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 5.0, right: 5.0),
                            child: Center(
                              child: Text(
                                '\$ $price',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 20,
                          width: 45,
                          decoration: BoxDecoration(
                              color: Get.isDarkMode ? mainColor : pinkClr,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 5.0, right: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextUtils(
                                    clr: Colors.white,
                                    txt: '$rate',
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                                const Icon(
                                  Icons.star,
                                  size: 13,
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
