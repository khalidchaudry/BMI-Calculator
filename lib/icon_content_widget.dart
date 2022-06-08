import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class IconContent extends StatelessWidget {
  const IconContent({
    Key? key,
    required this.iconData,
    required this.text,
  }) : super(key: key);
  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          size: 80,
          color: Colors.white,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: textstyle,
        )
      ],
    );
  }
}
