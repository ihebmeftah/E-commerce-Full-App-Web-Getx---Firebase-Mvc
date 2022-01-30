import 'package:ecommerceapp/logic/controllers/categorycontroller.dart';
import 'package:ecommerceapp/view/screens/productdetailsscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerceapp/logic/controllers/panniercontroller.dart';
import 'package:ecommerceapp/logic/controllers/productcontrollers.dart';
import 'package:ecommerceapp/models/productmodels.dart';
import 'package:ecommerceapp/utils/theme.dart';
import 'package:ecommerceapp/view/widgets/textutils.dart';
import 'package:loading_overlay_pro/loading_overlay_pro.dart';

class Categoryitems extends StatelessWidget {
  Categoryitems({Key? key}) : super(key: key);
  final controller = Get.find<ProductControllers>();
  final pannierController = Get.find<PannierController>();
  final catController = Get.find<CategoryControlle>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: const Text('Category items'),
        centerTitle: true,
        backgroundColor: Get.isDarkMode ? mainColor : darkGreyClr,
      ),
      body: Obx(() {
        if (catController.catALLLoading.value) {
          return Center(
              child: LoadingBouncingLine.circle(
            borderColor: Colors.cyan,
            borderSize: 3.0,
            size: 80.0,
            backgroundColor: Get.isDarkMode ? mainColor : pinkClr,
            duration: const Duration(milliseconds: 1500),
          ));
        } else {
          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.8,
                mainAxisSpacing: 9.0,
                crossAxisCount: 2,
                mainAxisExtent: 210),
            itemCount: catController.categoryAll.length,
            itemBuilder: (BuildContext context, int index) {
              return buildCardItems(
                  img: catController.categoryAll[index].image,
                  price: catController.categoryAll[index].price,
                  rate: catController.categoryAll[index].rating.rate,
                  id: catController.categoryAll[index].id,
                  prodMod: catController.categoryAll[index],
                  index: index,
                  ontap: () {
                    Get.to(() => ProductDetails(
                          productModels: catController.categoryAll[index],
                        ));
                  });
            },
          );
        }
      }),
    );
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
                        controller.mangFav(id);
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
