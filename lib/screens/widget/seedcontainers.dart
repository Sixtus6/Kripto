import 'package:flutter/material.dart';
import 'package:kripto/config/color.dart';
import 'package:kripto/config/size.dart';
import 'package:kripto/utils/style.dart';

class seedgrid extends StatelessWidget {
  const seedgrid({
    Key? key,
    required this.textdata,
    required this.requiresinput,
  }) : super(key: key);

  final String textdata;
  final bool requiresinput;

  @override
  Widget build(BuildContext context) {
    return Container(
     decoration: BoxDecoration(
      border: Border.all(
          color: ColorConfig.inputBorderColor,
        ),
      borderRadius: BorderRadius.circular(14),
      color: ColorConfig.white
     ),
      child: requiresinput? Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 2),
            child: Row(
              children: [
                Text(
                        textdata,
                        style: titleStyle(context, true,
                            size: 18, color: ColorConfig.black),
                      ),
                      Container(
                        
                        height: SizeConfig.getPercentageWidth(6),
                        width: SizeConfig.getPercentageWidth(18 ),
                       
                        child: TextFormField(
                style: titleStyle(context, true,
                    size: 18, color: ColorConfig.black),
                cursorColor: ColorConfig.splash,
               // controller: seedpharse,
                keyboardType: TextInputType.multiline,
                autocorrect: true,
                decoration:
                    InputDecoration(border: InputBorder.none),
              ),
              //         ),
             ) ],
            ),
          ),
        ],
      ): Center(child: Text(
                        textdata,
                        style: titleStyle(context, true,
                            size: 18, color: ColorConfig.black),
                      ),),
      
    );
  }
}