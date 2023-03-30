import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  double height;

  SmallText({
    super.key,
    this.color = Colors.black38,
    required this.text,
    this.height = 1.2,
    this.size = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontFamily: 'Roboto',
        color: color,
        height: height,
      ),
    );
  }
}
