import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceapp/utils/theme.dart';
import 'package:ecommerceapp/view/widgets/details/colorpicker.dart';
import 'package:flutter/material.dart';
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
      ],
    );
  }
}
