import 'package:ecommerceapp/view/widgets/textutils.dart';
import 'package:flutter/material.dart';

class CheckWidget extends StatelessWidget {
  const CheckWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset("images/check.png"),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Row(
          children: const [
            TextUtils(
                clr: Colors.black,
                txt: 'I accept ',
                fontSize: 16,
                fontWeight: FontWeight.normal),
            Text(
              'terms & conditions',
              style: TextStyle(
                  fontSize: 16 ,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  decoration: TextDecoration.underline),
            )
          ],
        )
      ],
    );
  }
}
