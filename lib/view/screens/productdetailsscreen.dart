import 'package:ecommerceapp/models/productmodels.dart';
import 'package:ecommerceapp/view/widgets/details/clothesinfor.dart';
import 'package:ecommerceapp/view/widgets/details/imageslider.dart';
import 'package:ecommerceapp/view/widgets/details/sizelist.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class ProductDetails extends StatelessWidget {
  final ProductModels productModels;
  const ProductDetails({required this.productModels, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSlider(
                url: productModels.image,
              ),
              ClothesInfo(
                title: productModels.title,
                id: productModels.id,
                rate: productModels.rating.rate,
                descp: productModels.description,
              ),
              const SizeLlist(),
            ],
          ),
        ),
      ),
    );
  }
}
