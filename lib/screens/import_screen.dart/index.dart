import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kripto/config/color.dart';
import 'package:kripto/config/navigator.dart';
import 'package:kripto/config/size.dart';
import 'package:kripto/screens/dashboardScreen/index.dart';
import 'package:kripto/screens/landingPage/index.dart';
import 'package:kripto/screens/widget/button.dart';
import 'package:kripto/screens/widget/seedcontainers.dart';
import 'package:kripto/utils/style.dart';

class ImportScreen extends StatefulWidget {
  const ImportScreen({super.key});

  @override
  State<ImportScreen> createState() => _ImportScreenState();
}

class _ImportScreenState extends State<ImportScreen> {
  TextEditingController seedpharse = TextEditingController();
  String t = "1.";
   List data = [
    {
      "add": "1.",
    },
    {
    
      "add": "2.",
    },
    {
       "add": "3.",
    },
     {
      "add": "4.",
    },
    {
    
      "add": "5.",
    },
    {
       "add": "6.",
    },
     {
      "add": "7.",
    },
    {
    
      "add": "8.",
    },
    {
       "add": "9.",
    },
      {
      "add": "10.",
    },
    {
    
      "add": "11.",
    },
    {
       "add": "12.",
    }
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.getPercentageHeight(15),
            ),
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.getPercentageWidth(5)),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        child: GestureDetector(
                      onTap: (() {
                        print(
                            "type the 12 words you were given when you created the wallet you want to import");
                        // customAlertbox(context, false);
                      }),
                      child: Text(
                        "Import your recovery phrase",
                        style: titleStyle(context, true, size: 29),
                      ),
                    )),
                    SizedBox(
                      height: SizeConfig.getPercentageHeight(2),
                    ),
                    Text(
                      "Type the 12 words you were given when you created the wallet you want to import",
                      textAlign: TextAlign.left,
                      style: titleStyle(context, false, size: 17),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.getPercentageHeight(7),
            ),


 Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: ColorConfig.seedContainer.withOpacity(0.11),),
             
              height: SizeConfig.getPercentageWidth(80),
              
              margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.getPercentageWidth(7)
              ),
            // //  width: SizeConfig.getPercentageWidth(150),
              padding: EdgeInsets.symmetric(
               horizontal: SizeConfig.getPercentageWidth(3)
              ),
          
              child: GridView.builder(
                 physics: NeverScrollableScrollPhysics(),
                  itemCount: 12,
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, 
                    mainAxisSpacing: SizeConfig.getPercentageWidth(6),
                    childAspectRatio: 2,
                    crossAxisSpacing: 8,
                    mainAxisExtent: SizeConfig.getPercentageWidth(11),

                    ),
                     itemBuilder: (BuildContext context, index){
                return seedgrid(textdata: data[index]['add'] , requiresinput: true,);
              }),
            ),

            // seedContainers(
            //   t: t,
            //   seedpharse: seedpharse,
            //   requiresfield: true,
            // ),
            SizedBox(
              height: SizeConfig.getPercentageHeight(14),
            ),
            GestureDetector(
              onTap: (() {
                 NavConfig.push(context, const DashboardScreen());
              }),
              child: CustomButton(
                text: "Import Wallet",
                isColored: true,
              ),
            )
          ],
        ),
      ),
    );
  }
}
