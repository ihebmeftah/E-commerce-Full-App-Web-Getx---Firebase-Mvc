import 'package:ecommerceapp/logic/controllers/productcontrollers.dart';
import 'package:ecommerceapp/utils/theme.dart';
import 'package:ecommerceapp/view/widgets/textutils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({Key? key}) : super(key: key);
  final controller = Get.put(ProductControllers());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx(() {
        if (controller.favProductList.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Image.asset('images/heart.png'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextUtils(
                    clr: Get.isDarkMode ? Colors.black : Colors.white,
                    txt: 'Please, Add your favorites products.',
                    fontSize: 16,
                    fontWeight: FontWeight.bold)
              ],
            ),
          );
        } else {
          return ListView.separated(
              itemCount: controller.favProductList.length,
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  thickness: 0.5,
                  color: Colors.grey,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return buildFavItems(
                    category: controller.favProductList[index].category
                        .toString()
                        .split('.')[1]
                        .replaceAll('_', ' '),
                    id: controller.favProductList[index].id,
                    img: controller.favProductList[index].image,
                    price: controller.favProductList[index].price,
                    rate: controller.favProductList[index].rating.rate,
                    title: controller.favProductList[index].title);
              });
        }
      }),
    ));
  }

  Widget buildFavItems(
      {required String img,
      required String category,
      required String title,
      required double price,
      required double rate,
      required int id}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        height: 100,
        child: Row(
          children: [
            Expanded(
              child: SizedBox(
                child: Card(
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                        height: 140,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                          child: Image.network(
                            img,
                            fit: BoxFit.cover,
                          ),
                        ))),
              ),
            ),
            Expanded(
              flex: 3,
              child: ListTile(
                title: Text(
                  title,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                trailing: IconButton(
                    onPressed: () {
                      controller.mangFav(id);
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: pinkClr,
                    )),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      '\$ $price',
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        TextUtils(
                            clr: Get.isDarkMode ? Colors.black : Colors.white,
                            txt: '$rate',
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.star,
                          size: 16,
                          color: Colors.yellow,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      category,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
