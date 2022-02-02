import 'package:ecommerceapp/logic/controllers/authcontroller.dart';
import 'package:ecommerceapp/logic/controllers/panniercontroller.dart';
import 'package:ecommerceapp/logic/controllers/paycontroller.dart';
import 'package:ecommerceapp/utils/theme.dart';
import 'package:ecommerceapp/view/widgets/textutils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PayMentMethodWidget extends StatefulWidget {
  const PayMentMethodWidget({Key? key}) : super(key: key);

  @override
  _PayMentMethodWidgetState createState() => _PayMentMethodWidgetState();
}

class _PayMentMethodWidgetState extends State<PayMentMethodWidget> {
  final payMentController = Get.find<PayMentController>();
  final cartController = Get.find<PannierController>();
  final authController = Get.find<Authcontroller>();
  int radioPaymentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        children: [
          GetBuilder<PayMentController>(
            builder: (_) => buildRadioPayment(
              name: "Paypal",
              image: 'images/paypal.png',
              scale: 0.7,
              value: 1,
              onChange: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          GetBuilder<PayMentController>(
            builder: (_) => buildRadioPayment(
              name: "Google Pay",
              image: 'images/google.png',
              scale: 0.8,
              value: 2,
              onChange: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          GetBuilder<PayMentController>(
            builder: (_) => buildRadioPayment(
              name: "Credit Card",
              image: 'images/credit.png',
              scale: 0.7,
              value: 3,
              onChange: (int? value) {
                setState(() {
                  radioPaymentIndex = value!;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRadioPayment({
    required String image,
    required double scale,
    required String name,
    required int value,
    required Function onChange,
  }) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  image,
                  scale: scale,
                ),
                const SizedBox(
                  width: 10,
                ),
                TextUtils(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  txt: name,
                  clr: Colors.black,
                ),
              ],
            ),
            Radio(
              value: value,
              groupValue: radioPaymentIndex,
              fillColor: MaterialStateColor.resolveWith((states) => mainColor),
              onChanged: (int? value) {
                onChange(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
