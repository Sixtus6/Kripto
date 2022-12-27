import 'package:flutter/material.dart';
import 'package:kripto/config/color.dart';
import 'package:kripto/config/size.dart';
import 'package:kripto/screens/widget/button.dart';
import 'package:kripto/utils/style.dart';

class AlertPopUp extends StatelessWidget {
  const AlertPopUp(
      {Key? key,
      required this.bottomText,
      required this.arrow,
      required this.topText,
      this.centericon})
      : super(key: key);
  final String? topText;
  final String bottomText;
  final bool arrow;
  final IconData? centericon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorConfig.white, borderRadius: BorderRadius.circular(8)),
      height: SizeConfig.getPercentageWidth(70),
      width: SizeConfig.getPercentageWidth(40),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 13, bottom: 13),
              child: Text(
                topText.toString(),
                style: titleStyle(context, true,
                    size: 20, color: ColorConfig.black),
              ),
            ),
            Stack(alignment: AlignmentDirectional.centerStart, children: [
              Container(
                height: SizeConfig.getPercentageWidth(40),
                width: SizeConfig.getPercentageWidth(40),
                decoration: BoxDecoration(
                  border: Border.all(color: ColorConfig.inputBorderColor),
                  color: ColorConfig.containerColor,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: arrow
                      ? Icon(
                          centericon,
                          color: ColorConfig.black,
                          size: 50,
                        )
                      : Image(
                          height: SizeConfig.getPercentageWidth(25),
                          image: AssetImage("assets/images/icons/check.png")),
                ),
              ),
              arrow
                  ? Positioned(
                      left: -40,
                      child: Image(
                          height: SizeConfig.getPercentageWidth(10),
                          image: AssetImage("assets/images/icons/arow.png")),
                    )
                  : Positioned(
                      left: -100,
                      child: Image(
                          height: SizeConfig.getPercentageWidth(10),
                          image: AssetImage("assets/images/icons/arow.png")),
                    )
            ]),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  arrow
                      ? Text(
                          bottomText.toString(),
                          textAlign: TextAlign.center,
                          style: titleStyle(context, false,
                              size: 18, color: ColorConfig.black),
                        )
                      : GestureDetector(
                        onTap: (() {
                           Navigator.of(context).pop();
                        }),
                        child: CustomButton(
                            isColored: true,
                            text: "Continue",
                          ),
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
