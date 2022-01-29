import 'package:ecommerceapp/logic/controllers/productcontrollers.dart';
import 'package:ecommerceapp/utils/theme.dart';
import 'package:ecommerceapp/view/widgets/textutils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class ClothesInfo extends StatelessWidget {
  ClothesInfo(
      {Key? key,
      required this.title,
      required this.id,
      required this.rate,
      required this.descp})
      : super(key: key);
  final String title;
  final String descp;
  final double rate;
  final int id;

  final productControl = Get.find<ProductControllers>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.black : Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Obx(() {
                return CircleAvatar(
                  backgroundColor: !Get.isDarkMode
                      ? Colors.white.withOpacity(0.4)
                      : Colors.blueGrey.withOpacity(0.4),
                  child: IconButton(
                    icon: productControl.isFav(id)
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(
                            Icons.favorite_outline,
                            color: Colors.black,
                          ),
                    onPressed: () {
                      productControl.mangFav(id);
                    },
                  ),
                );
              })
            ],
          ),
          Row(
            children: [
              TextUtils(
                  clr: Get.isDarkMode ? Colors.black : Colors.white,
                  txt: rate.toString(),
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
              const SizedBox(
                width: 8,
              ),
              RatingBar.builder(
                itemSize: 20,
                initialRating: rate,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemPadding: const EdgeInsets.all(4),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
                ignoreGestures: true,
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          ReadMoreText(
            descp,
            trimLines: 3,
            trimMode: TrimMode.Line,
            textAlign: TextAlign.justify,
            trimCollapsedText: 'Show more.',
            trimExpandedText: 'Show less.',
            moreStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode ? mainColor : pinkClr,
            ),
            style: TextStyle(
              fontSize: 16,
              height: 2,
              color: Get.isDarkMode ? Colors.black : Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
