import 'package:flutter/material.dart';
import '../../../helper/Constants/MyColors.dart';

class CustomerServiceDetails extends StatelessWidget {
  const CustomerServiceDetails({
    super.key,
    required this.text,
    required this.icon,
    this.iconColor = kBlackColor26,
  });

  final String text;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        spacing: 10,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: 16,
          ),
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: kBlackColor38,
            ),
          ),
        ],
      ),
    );
  }
}
