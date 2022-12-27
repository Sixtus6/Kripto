
import 'package:flutter/material.dart';
import 'package:kripto/config/color.dart';
import 'package:kripto/config/size.dart';
import 'package:kripto/utils/style.dart';

class coinpricescontainer extends StatelessWidget {
  const coinpricescontainer({
    Key? key,
    required this.coinname,
    required this.dollarval,
    required this.shortform,
    required this.percentchange,
  }) : super(key: key);

  final String coinname;
  final String dollarval;
  final String shortform;
  final String percentchange;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.amberAccent,
      margin: EdgeInsets.only(top: SizeConfig.getPercentageWidth(3),bottom:  SizeConfig.getPercentageWidth(3)), 
      //margin: EdgeInsets.symmetric(vertical: SizeConfig.getPercentageWidth(3)),
      child: Row(
        children: [
          CircleAvatar(backgroundColor: ColorConfig.brown,),
          // SizedBox(width: SizeConfig.getPercentageWidth(2),),
          //                Text('-1.55%', style: titleStyle(context, false, size: 14, color: ColorConfig.red),),
          Container(
            margin: EdgeInsets.only(left:SizeConfig.getPercentageWidth(2) ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                    Text(coinname,style: titleStyle(context, false, size: 16)),
                    SizedBox(height: SizeConfig.getPercentageWidth(1),),
                    Text('\$'+dollarval,style: titleStyle(context, false, size: 14, color: ColorConfig.coindollars.withOpacity(0.81))),
            ],),
          ),
            Expanded(child: Container()),
            Container(
            margin: EdgeInsets.only(right:SizeConfig.getPercentageWidth(6) ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
             // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                    Text(shortform,style: titleStyle(context, false, size: 14)),
                    
                    // SizedBox(height: SizeConfig.getPercentageWidth(1),),
                     Text('24hrs', style: titleStyle(context, false, size: 14, color: ColorConfig.red),),
                      Text('-'+percentchange+ '%', style: titleStyle(context, false, size: 14, color: ColorConfig.red),),
                     
            ],),
          )
        ],
      ),
    );
  }
}


