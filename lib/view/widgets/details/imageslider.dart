import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceapp/logic/controllers/panniercontroller.dart';
import 'package:ecommerceapp/routes/routes.dart';
import 'package:ecommerceapp/utils/theme.dart';
import 'package:ecommerceapp/view/widgets/details/colorpicker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSlider extends StatefulWidget {
  final String url;
  const ImageSlider({Key? key, required this.url}) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  CarouselController carouselController = CarouselController();
  int activeIndex = 0;
  final List<Color> colorSelected = [
    kCOlor1,
    kCOlor2,
    kCOlor3,
  ];
  int currentPage = 0;
  int currentColor = 0;
  final panniercontroller = Get.find<PannierController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
            itemCount: 3,
            carouselController: carouselController,
            itemBuilder: (context, index, realIndex) {
              return Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(widget.url),
                      fit: BoxFit.fill,
                    )),
              );
            },
            options: CarouselOptions(
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
                viewportFraction: 1,
                autoPlay: true,
                height: 500,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                autoPlayAnimationDuration: const Duration(seconds: 2))),
        Positioned(
            bottom: 30,
            left: 180,
            child: AnimatedSmoothIndicator(
                activeIndex: activeIndex,
                count: 3,
                effect: ExpandingDotsEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotColor: Get.isDarkMode ? mainColor : pinkClr,
                    dotColor: Colors.black))),
        Positioned(
          bottom: 30,
          right: 30,
          child: Container(
            height: 140,
            width: 50,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(30),
            ),
            child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentColor = index;
                    });
                  },
                  child: ColorPicker(
                    color: colorSelected[index],
                    outerBorder: currentColor == index,
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 3),
              itemCount: colorSelected.length,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: Get.isDarkMode
                    ? mainColor.withOpacity(0.6)
                    : pinkClr.withOpacity(0.6),
                radius: 18,
                child: Center(
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new,
                        size: 18,
                        color: !Get.isDarkMode ? Colors.black : Colors.white,
                      )),
                ),
              ),
              CircleAvatar(
                  backgroundColor: Get.isDarkMode
                      ? mainColor.withOpacity(0.6)
                      : pinkClr.withOpacity(0.6),
                  radius: 18,
                  child: Center(
                    child: Obx(() {
                      return Badge(
                        position: BadgePosition.topEnd(top: -10, end: -10),
                        animationDuration: const Duration(milliseconds: 300),
                        animationType: BadgeAnimationType.slide,
                        badgeContent: Text(
                          panniercontroller.productMap.isNotEmpty
                              ? panniercontroller.productMap.length.toString()
                              : '',
                          style: const TextStyle(color: Colors.white),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Get.toNamed(Routes.pannierScreen);
                          },
                          icon: const FaIcon(FontAwesomeIcons.shoppingCart),
                          iconSize: 18,
                          color: !Get.isDarkMode ? Colors.black : Colors.white,
                        ),
                      );
                    }),
                  )),
            ],
          ),
        )
      ],
    );
  }
}
