import 'package:flutter/material.dart';
import 'package:kripto/config/color.dart';
import 'package:kripto/config/size.dart';
import 'package:kripto/utils/style.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final int? h;
  final int? w;
  final int? tsize;
  final bool? isColored;

  const CustomButton(
      {super.key,
      required this.text,
      this.h = 13,
      this.w = 70,
      this.tsize = 25,
      this.isColored});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          text,
          style: isColored!
              ? titleStyle(context, true, size: double.parse(tsize.toString()))
              : titleStyle(context, true,
                  size: double.parse(tsize.toString()),
                  color: ColorConfig.splash),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: isColored! ? ColorConfig.splash : ColorConfig.white,
      ),
      height: SizeConfig.getPercentageWidth(h!),
      width: SizeConfig.getPercentageWidth(w!),
    );
  }
}
