import 'package:ecommerceapp/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeLlist extends StatefulWidget {
  const SizeLlist({Key? key}) : super(key: key);

  @override
  State<SizeLlist> createState() => _SizeLlistState();
}

final List<String> size = [
  'S',
  'M',
  'L',
  'XL',
  'XXL',
];
int indexC = 0;

class _SizeLlistState extends State<SizeLlist> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      height: 60,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: size.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 10,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  indexC = index;
                });
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  color: Get.isDarkMode
                      ? indexC == index
                          ? mainColor.withOpacity(0.4)
                          : Colors.white
                      : indexC == index
                          ? pinkClr.withOpacity(0.4)
                          : Colors.black,
                  borderRadius: BorderRadius.circular(15),
                  border:
                      Border.all(color: Colors.grey.withOpacity(0.5), width: 2),
                ),
                child: Text(size[index],
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.black : Colors.white,
                        fontWeight: FontWeight.w600)),
              ));
        },
      ),
    );
  }
}
