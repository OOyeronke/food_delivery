import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery/widgets/small_text.dart';

import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  const AppColumn({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.font20,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                  (index) => const Icon(
                        Icons.star,
                        color: Colors.blue,
                        size: 14,
                      )),
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(
              text: '4.5',
            ),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(text: '1287'),
            SizedBox(
              width: Dimensions.width10,
            ),
            SmallText(text: 'comments')
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
                icon: Icons.circle_sharp,
                text: 'Normal',
                iconColor: Colors.orange),
            IconAndTextWidget(
                icon: Icons.location_on, text: '1.7km', iconColor: Colors.blue),
            IconAndTextWidget(
                icon: Icons.access_time_rounded,
                text: '32min',
                iconColor: Colors.red),
          ],
        ),
      ],
    );
  }
}
