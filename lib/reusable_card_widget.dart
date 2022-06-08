import 'package:flutter/material.dart';

class ReuseableCardWidget extends StatelessWidget {
  const ReuseableCardWidget({
    Key? key,
    required this.color,
    required this.child,
    required this.press,
  }) : super(key: key);
  final Color color;
  final Widget child;
  final Function() press;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: child,
      ),
    );
  }
}
