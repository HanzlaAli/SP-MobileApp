import 'package:flutter/material.dart';

class EmptyDataScreen extends StatelessWidget {
  EmptyDataScreen({required this.text, super.key});
  String? text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/Images/empty-img.png'),
          const Text(
            '',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
