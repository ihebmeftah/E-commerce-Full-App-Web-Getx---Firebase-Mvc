import 'package:flutter/material.dart';

class AuthFields extends StatelessWidget {
  final TextEditingController cntrl;
  final bool isPass;
  final Function validate;
  final Widget pIcon, sIcon;
  final String hText;
  const AuthFields(
      {required this.cntrl,
      required this.hText,
      required this.pIcon,
      required this.sIcon,
      required this.isPass,
      required this.validate,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.black),
      textInputAction: TextInputAction.next,
      controller: cntrl,
      obscureText: isPass,
      cursorColor: Colors.black,
      keyboardType: TextInputType.text,
      validator: (value) => validate(value),
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        prefixIcon: pIcon,
        suffix: sIcon,
        hintText: hText,
        hintStyle: const TextStyle(
            color: Colors.black45, fontSize: 18, fontWeight: FontWeight.w500),
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
