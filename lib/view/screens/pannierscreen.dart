import 'package:ecommerceapp/logic/controllers/panniercontroller.dart';
import 'package:ecommerceapp/models/productmodels.dart';
import 'package:ecommerceapp/utils/theme.dart';
import 'package:ecommerceapp/view/widgets/textutils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PannierScreen extends StatelessWidget {
  PannierScreen({Key? key}) : super(key: key);
  final panniercontroller = Get.find<PannierController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Pannier Items'),
        backgroundColor: Get.isDarkMode ? mainColor : darkGreyClr,
        actions: [
          IconButton(
              onPressed: () {
                panniercontroller.clearALL();
              },
              icon: const Icon(Icons.backspace))
        ],
      ),
      body: Obx(() {
        if (panniercontroller.productMap.isEmpty) {
          return emptyCart();
        } else {
          return SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                height: 500,
                child: ListView.separated(
                  itemCount: panniercontroller.productMap.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 20,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return cardProduct(
                        productModels:
                            panniercontroller.productMap.keys.toList()[index],
                        index: index,
                        qte: panniercontroller.productMap.values
                            .toList()[index]);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Obx(
                    () => cardTotal(totale: panniercontroller.totalPannier)),
              ),
            ],
          ));
        }
      }),
    ));
  }

  Widget cardTotal({
    required String totale,
  }) {
    return Container(
      padding: const EdgeInsets.all(25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const TextUtils(
                  clr: Colors.grey,
                  txt: 'Total',
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              TextUtils(
                  clr: !Get.isDarkMode ? Colors.white : Colors.black,
                  txt: '\$ $totale',
                  fontSize: 20,
                  fontWeight: FontWeight.bold)
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: SizedBox(
            height: 60,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    elevation: 0,
                    primary: Get.isDarkMode ? mainColor : pinkClr),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    TextUtils(
                        clr: Colors.white,
                        txt: 'Check Out ',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(Icons.shop)
                  ],
                )),
          ))
        ],
      ),
    );
  }

  Widget emptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart,
            size: 150,
            color: !Get.isDarkMode ? Colors.white : Colors.black,
          ),
          const SizedBox(
            height: 40,
          ),
          Text.rich(TextSpan(children: [
            TextSpan(
                text: 'You Cart is ',
                style: TextStyle(
                    color: !Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: 'Empty',
                style: TextStyle(
                    color: Get.isDarkMode ? mainColor : pinkClr,
                    fontSize: 28,
                    fontWeight: FontWeight.bold))
          ])),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Add items to get Started',
            style: TextStyle(color: !Get.isDarkMode ? pinkClr : mainColor),
          )
        ],
      ),
    );
  }

  Widget cardProduct(
      {required ProductModels productModels,
      required int index,
      required int qte}) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 130,
      width: 100,
      decoration: BoxDecoration(
          color: Get.isDarkMode
              ? mainColor.withOpacity(0.7)
              : pinkClr.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              margin: const EdgeInsets.all(8),
              height: 120,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(productModels.image),
                  ))),
          const SizedBox(
            width: 20,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productModels.title,
                style: TextStyle(
                    color: !Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '\$ ${panniercontroller.productPrice[index].toStringAsFixed(2)}',
                style: TextStyle(
                    color: !Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold),
              )
            ],
          )),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        panniercontroller.removeproductTopannier(productModels);
                      },
                      icon: Icon(
                        Icons.remove_circle,
                        color: !Get.isDarkMode ? Colors.white : Colors.black,
                      )),
                  Text(
                    '$qte',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        panniercontroller.addproductTopannier(productModels);
                      },
                      icon: Icon(
                        Icons.add_circle,
                        color: !Get.isDarkMode ? Colors.white : Colors.black,
                      ))
                ],
              ),
              IconButton(
                  onPressed: () {
                    panniercontroller.removeOneProduct(productModels);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Get.isDarkMode ? Colors.red : Colors.black,
                    size: 20,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
