import 'package:ecommerceapp/utils/theme.dart';
import 'package:ecommerceapp/view/widgets/textutils.dart';
import 'package:flutter/material.dart';

class BottomContainer extends StatelessWidget {
  final String txt, txt2;
  final Function() onPress;
  const BottomContainer(
      {required this.txt, required this.txt2, required this.onPress, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90,
      decoration: const BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
              clr: Colors.white,
              txt: txt,
              fontSize: 20,
              fontWeight: FontWeight.bold),
          TextButton(
              onPressed: onPress,
              child: TextUtils(
                  clr: Colors.white,
                  txt: txt2,
                  fontSize: 20,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
