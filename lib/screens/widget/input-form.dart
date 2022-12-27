import 'package:flutter/material.dart';
import 'package:kripto/config/color.dart';
import 'package:kripto/config/size.dart';
import 'package:kripto/utils/style.dart';

class CustomInput extends StatefulWidget {
  const CustomInput({
    Key? key,
    required this.emailController,
    required this.secure,
    required this.fieldname,
    required this.hint,
    required this.formicon,
  }) : super(key: key);

  final TextEditingController emailController;
  final bool secure;
  final String fieldname;
  final String hint;
  final IconData formicon;

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  bool isHidden = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          left: SizeConfig.getPercentageWidth(8),
          bottom: SizeConfig.getPercentageWidth(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 4),
            child: GestureDetector(
              onTap: (() {
                print("object");
              }),
              child: Text(
                widget.fieldname,
                style: titleStyle(context, false, size: 18),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 3),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorConfig.formColor,
                border: Border.all(
                  color: ColorConfig.inputBorderColor,
                )),
            margin: EdgeInsets.only(right: SizeConfig.getPercentageWidth(8)),
            child: TextFormField(
                cursorColor: ColorConfig.splash,
                controller: widget.emailController,
                keyboardType: TextInputType.text,
                obscureText: widget.secure
                    ? isHidden
                        ? true
                        : false
                    : false,
                decoration: formDecoration(
                  widget.hint,
                  Icon(
                    widget.formicon,
                    color: ColorConfig.inputIconColor,
                  ),
                )),
          ),
        ],
      ),
    );
  }

  InputDecoration formDecoration(
    String text,
    Icon? display,
  ) {
    return InputDecoration(
      hintText: text,
      hintStyle: TextStyle(
        color: ColorConfig.white,
        fontSize: 18,
      ),
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      prefixIcon: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: GestureDetector(
          onTap: (() {}),
          child: Icon(
            widget.formicon,
            color: ColorConfig.inputIconColor,
          ),
        ),
      ),
      suffixIcon: widget.secure
          ? Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: GestureDetector(
                  onTap: (() {
                    setState(() {
                      isHidden = !isHidden;
                    });
                  }),
                  child: Icon(
                    isHidden ? Icons.visibility_off : Icons.visibility,
                    color: ColorConfig.inputIconColor,
                  )),
            )
          : null,
    );
  }
}
