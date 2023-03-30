import 'package:flutter/material.dart';
import 'package:food_delivery/utils/dimensions.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String text;
  double size;
  TextOverflow overFlow;

  BigText(
      {super.key,
      this.overFlow = TextOverflow.ellipsis,
      this.size = 0,
      this.color = Colors.black,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overFlow,
      style: TextStyle(
          fontSize: size == 0 ? Dimensions.font20 : size,
          fontFamily: 'Roboto',
          color: color,
          fontWeight: FontWeight.w400),
    );
  }
}
