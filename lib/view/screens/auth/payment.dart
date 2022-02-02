import 'package:ecommerceapp/utils/theme.dart';
import 'package:ecommerceapp/view/widgets/textutils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController phoneController = TextEditingController();
  int radioContinerIndes = 1;
  bool changeColors = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Payment'),
        backgroundColor: Get.isDarkMode ? mainColor : darkGreyClr,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextUtils(
                clr: Get.isDarkMode ? Colors.black : Colors.white,
                txt: 'Shipping to',
                fontSize: 24,
                fontWeight: FontWeight.bold),
            const SizedBox(
              height: 20,
            ),
            delivertyWidget(
                changeColors: changeColors,
                radioContinerIndes: radioContinerIndes),
            const SizedBox(
              height: 20,
            ),
            TextUtils(
                clr: Get.isDarkMode ? Colors.black : Colors.white,
                txt: 'Payment Methode',
                fontSize: 24,
                fontWeight: FontWeight.bold),
            //paymethode(),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  buildContainer({
    required Color color,
    required int value,
    required Function onChanged,
    required String name,
    required String title,
    required String phone,
    required String address,
    required Widget icon,
  }) {
    return Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  spreadRadius: 3,
                  blurRadius: 5),
            ],
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Radio(
              value: value,
              groupValue: 8,
              fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
              onChanged: (int? value) {
                onChanged(value);
              },
            ),
            const SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextUtils(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    txt: title,
                    clr: Colors.black,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextUtils(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    txt: name,
                    clr: Colors.black,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const Text('🇪🇬+02 '),
                      TextUtils(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        txt: phone,
                        clr: Colors.black,
                      ),
                      const SizedBox(
                        width: 120,
                      ),
                      SizedBox(
                        child: icon,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextUtils(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    txt: address,
                    clr: Colors.black,
                  ),
                ],
              ),
            )
          ],
        ));
  }

  delivertyWidget(
      {required bool changeColors, required int radioContinerIndes}) {
    return Column(
      children: [
        buildContainer(
          address: "Egypt,sohag medanelshoban el moslmean",
          name: "asroo store",
          phone: "51-887-9932",
          title: "Asroo Shop",
          value: 1,
          color: changeColors ? Colors.white : Colors.grey.shade300,
          icon: Container(),
          onChanged: (int? value) {
            setState(() {
              radioContinerIndes = value!;
              changeColors = !changeColors;
            });
          },
        ),
        SizedBox(
          height: 10,
        ),
        buildContainer(
          address: "Egypt,sohag medanelshoban el moslmean",
          name: "asroo store",
          phone: "51-887-9932",
          title: "Asroo Shop",
          value: 1,
          color: changeColors ? Colors.white : Colors.grey.shade300,
          icon: Container(),
          onChanged: (int? value) {
            setState(() {
              radioContinerIndes = value!;
              changeColors = !changeColors;
            });
          },
        )
      ],
    );
  }

  paymethode() {}
}
