
import 'package:flutter/material.dart';
import 'package:kripto/config/color.dart';
import 'package:kripto/config/size.dart';
import 'package:kripto/utils/style.dart';

class Purplebutton extends StatelessWidget {
  const Purplebutton({
    Key? key,
    required this.img,
    required this.text
  }) : super(key: key);

  final String img;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container( margin: EdgeInsets.only(        
           top:  SizeConfig.getPercentageWidth(5)),     
      child: Column(
        children: [
          CircleAvatar(backgroundColor: ColorConfig.splash, radius: SizeConfig.getPercentageWidth(6),
          child:Image( height: SizeConfig.getPercentageWidth(6),image: AssetImage(img))),
            SizedBox(
                height: SizeConfig.getPercentageWidth(2),
              ),
            Text(text, style: titleStyle(context, true, size: 18)),

          ],
      ),
    );
  }}