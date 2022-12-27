import 'package:flutter/material.dart';
import 'package:kripto/config/color.dart';
import 'package:kripto/config/size.dart';

class Graphcontainer extends StatelessWidget {
  const Graphcontainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: ColorConfig.black.withOpacity(0.7), border: Border.all(color: ColorConfig.inputBorderColor.withOpacity(0.40)),),
    height: SizeConfig.getPercentageWidth(40),
    width: SizeConfig.getPercentageWidth(45),
    );
  }
}