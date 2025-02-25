import 'package:flutter/material.dart';

import '../../helper/Constants/MyColors.dart';

class BadRequestScreen extends StatelessWidget {
  const BadRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/Images/NotFounded.png'),
          const Text(
            'Not Founded!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
