import 'package:ecommerceapp/logic/controllers/categorycontroller.dart';
import 'package:ecommerceapp/utils/theme.dart';
import 'package:ecommerceapp/view/widgets/categoryitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);

  final categoryController = Get.find<CategoryControlle>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Obx(() {
        if (categoryController.catLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? mainColor : pinkClr,
            ),
          );
        } else {
          return buildCat();
        }
      }),
    ));
  }

  Widget buildCat() {
    return ListView.separated(
      itemCount: categoryController.categoryName.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          height: 5,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Get.to(Categoryitems());
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Get.isDarkMode ? mainColor : pinkClr, width: 2),
                  image: DecorationImage(
                      image: NetworkImage(
                        categoryController.imageCategory[index],
                      ),
                      fit: BoxFit.cover)),
              child: Text(
                ' ${categoryController.categoryName[index].capitalize} ',
                style: TextStyle(
                    backgroundColor: Get.isDarkMode
                        ? mainColor.withOpacity(0.5)
                        : pinkClr.withOpacity(0.5),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                    letterSpacing: 1.2,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ),
        );
      },
    );
  }
}
