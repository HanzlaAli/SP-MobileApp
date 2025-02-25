import 'package:flutter/material.dart';

class InternalServerErrorScreen extends StatelessWidget {
  const InternalServerErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/Images/internalServerError.png'),
          const Text(
            'Something wen\'t wrong!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          const Text(
            'Try again later',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
