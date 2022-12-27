import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kripto/config/color.dart';
import 'package:kripto/config/navigator.dart';
import 'package:kripto/config/size.dart';
import 'package:kripto/screens/dashboardScreen/index.dart';
import 'package:kripto/screens/landingPage/index.dart';
import 'package:kripto/screens/widget/alertbox.dart';
import 'package:kripto/screens/widget/button.dart';
import 'package:kripto/screens/widget/seedcontainers.dart';
import 'package:kripto/utils/style.dart';

class CreateWalletScreen extends StatefulWidget {
  const CreateWalletScreen({super.key});

  @override
  State<CreateWalletScreen> createState() => _CreateWalletScreenState();
}

class _CreateWalletScreenState extends State<CreateWalletScreen> {
  String textdata = "1.";
  String pharse = "secured";
 List data = [
    {
      "add": "package",
    },
    {
    
      "add": "assets",
    },
    {
       "add": "friend",
    },
     {
      "add": "soup",
    },
    {
    
      "add": "food",
    },
    {
       "add": "clean",
    },
     {
      "add": "music",
    },
    {
    
      "add": "crop",
    },
    {
       "add": "house",
    },
      {
      "add": "door",
    },
    {
    
      "add": "fry",
    },
    {
       "add": "bread",
    }
  ];
  void customAlertbox(BuildContext context, ) {
    showDialog(
        //  barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return   AlertDialog(
                  // iconColor: ic,
                  //  insetPadding: EdgeInsets.symmetric(horizontal: 6),
                  // contentPadding: EdgeInsets.zero,

                  backgroundColor: Colors.transparent,
                  content: AlertPopUp(
                    arrow: false,
                    //centericon: Icons.mail,
                    bottomText:
                        "Check your email for a link to confirm your mail",
                    topText: 'Copied to Clipboard !!',
                  ),
                );
        });
  }


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
                        "Save your recovery phrase",
                        style: titleStyle(context, true, size: 29),
                      ),
                    )),
                    SizedBox(
                      height: SizeConfig.getPercentageHeight(2),
                    ),
                    Text(
                      "You are the only one with these key words. you are expected to back them up and save them manually as your wallet cannot be recovered on loss of the key phrase",
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
            //  width: SizeConfig.getPercentageWidth(150),
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
                return seedgrid(textdata: data[index]['add'].toString(), requiresinput: false,);
              }),
            ),
            SizedBox(
              height: SizeConfig.getPercentageHeight(10),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                  customAlertbox(context);
                  },
                  child: CustomButton(
                    isColored: false,
                    w: 35,
                    h: 10,
                    text: "Copy",
                    tsize: 25,
                  ),
                ),
                GestureDetector(onTap: (() {
                NavConfig.push(context, const DashboardScreen());
                  
                }),

                  child: CustomButton(
                    w: 35,
                    h: 10,
                    text: "Proceed",
                    tsize: 25,
                    isColored: true,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


