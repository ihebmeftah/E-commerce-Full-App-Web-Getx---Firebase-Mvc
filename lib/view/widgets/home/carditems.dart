import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay_pro/animations/bouncing_line.dart';

import 'package:ecommerceapp/logic/controllers/panniercontroller.dart';
import 'package:ecommerceapp/logic/controllers/productcontrollers.dart';
import 'package:ecommerceapp/models/productmodels.dart';
import 'package:ecommerceapp/utils/theme.dart';
import 'package:ecommerceapp/view/screens/productdetailsscreen.dart';
import 'package:ecommerceapp/view/widgets/textutils.dart';

class Carditems extends StatelessWidget {
  Carditems({Key? key}) : super(key: key);
  final controller = Get.find<ProductControllers>();
  final pannierController = Get.find<PannierController>();
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
          child: controller.searchList.isEmpty &&
                  controller.searchValue.text.isNotEmpty
              ? Image.asset('images/search_empty_dark.png')
              : GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.8,
                      mainAxisSpacing: 9.0,
                      crossAxisCount: 2,
                      mainAxisExtent: 210),
                  itemCount: controller.searchList.isEmpty
                      ? controller.productList.length
                      : controller.searchList.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (controller.searchList.isEmpty) {
                      return buildCardItems(
                          img: controller.productList[index].image,
                          price: controller.productList[index].price,
                          rate: controller.productList[index].rating.rate,
                          id: controller.productList[index].id,
                          prodMod: controller.productList[index],
                          index: index,
                          ontap: () {
                            Get.to(() => ProductDetails(
                                  productModels: controller.productList[index],
                                ));
                          });
                    } else {
                      return buildCardItems(
                          img: controller.searchList[index].image,
                          price: controller.searchList[index].price,
                          rate: controller.searchList[index].rating.rate,
                          id: controller.searchList[index].id,
                          prodMod: controller.searchList[index],
                          index: index,
                          ontap: () {
                            Get.to(() => ProductDetails(
                                  productModels: controller.searchList[index],
                                ));
                          });
                    }
                  },
                ),
        );
      }
    });
  }

  Widget buildCardItems(
      {required String img,
      required double price,
      required double rate,
      required int id,
      required ProductModels prodMod,
      required int index,
      required Function() ontap}) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: InkWell(
        onTap: ontap,
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
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (!controller.isFav(id)) {
                          try {
                            controller.mangFav(id);

                            Get.snackbar('Successfully ',
                                'Your product was Successfully added to your favorites ',
                                backgroundColor:
                                    Get.isDarkMode ? mainColor : pinkClr,
                                colorText: Colors.white,
                                snackPosition: SnackPosition.BOTTOM,
                                margin: const EdgeInsets.all(10),
                                isDismissible: true,
                                duration: const Duration(seconds: 2));
                          } catch (e) {
                            Get.snackbar(
                              'Error ',
                              'Error in  add to your cart ',
                              backgroundColor: Colors.redAccent,
                              colorText: Colors.white,
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        } else {
                          try {
                            controller.mangFav(id);

                            Get.snackbar('Successfully Removed ',
                                'Your product was Successfully added from your favorites ',
                                backgroundColor:
                                    Get.isDarkMode ? mainColor : pinkClr,
                                colorText: Colors.white,
                                snackPosition: SnackPosition.BOTTOM,
                                margin: const EdgeInsets.all(10),
                                isDismissible: true,
                                duration: const Duration(seconds: 2));
                          } catch (e) {
                            Get.snackbar(
                              'Error ',
                              'Error in  add to your cart ',
                              backgroundColor: Colors.redAccent,
                              colorText: Colors.white,
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        }
                      },
                      icon: !controller.isFav(id)
                          ? const Icon(Icons.favorite_outline)
                          : const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                      color: Colors.black,
                    ),
                    IconButton(
                      onPressed: () {
                        pannierController.addproductTopannier(prodMod);

                        try {
                          pannierController.addproductTopannier(prodMod);
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
                      icon: const Icon(Icons.shopping_cart),
                      color: Colors.black,
                    ),
                  ],
                );
              }),
              Container(
                height: 140,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
      ),
    );
  }
}
