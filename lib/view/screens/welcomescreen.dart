import 'package:flutter/material.dart';

class Welcomescreen extends StatelessWidget {
  const Welcomescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('hello world'),
      ),
    );
  }
}
