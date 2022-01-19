import 'package:ecommerceapp/utils/theme.dart';
import 'package:ecommerceapp/view/widgets/textutils.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String txt;
  final Function() onPressed;
  const AuthButton({required this.txt,required this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: mainColor, minimumSize: const Size(360, 50)),
      onPressed: onPressed,
      child: TextUtils(
          clr: Colors.white,
          txt: txt,
          fontSize: 18,
          fontWeight: FontWeight.bold),
    );
  }
}
