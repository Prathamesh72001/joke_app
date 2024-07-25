import 'package:flutter/material.dart';
import 'package:joke_app/utility/colors.dart';

class CommonTextWidget extends StatelessWidget {
  final String text;
  final double fontsize;
  final FontWeight fontweight;
  const CommonTextWidget(
      {super.key,
      required this.text,
      this.fontsize = 15,
      this.fontweight = FontWeight.normal,});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: BrandColors.text_color,
          fontSize: fontsize,
          fontWeight: fontweight),
      overflow: TextOverflow.clip,
    );
  }
}
