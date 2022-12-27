import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kripto/config/navigator.dart';
import 'package:kripto/config/size.dart';
import 'package:kripto/screens/createWallet/index.dart';
import 'package:kripto/screens/widget/button.dart';
import 'package:kripto/utils/style.dart';

class Backupscreen extends StatefulWidget {
  const Backupscreen({super.key});

  @override
  State<Backupscreen> createState() => _BackupscreenState();
}

class _BackupscreenState extends State<Backupscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: SizeConfig.getPercentageWidth(8)),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: SizeConfig.getPercentageHeight(30),
                ),
                Container(
                    child: GestureDetector(
                  onTap: (() {
                    print(
                        "type the 12 words you were given when you created the wallet you want to import");
                    // customAlertbox(context, false);
                  }),
                  child: Text(
                    "Back-up your account",
                    style: titleStyle(context, true, size: 29),
                  ),
                )),
                SizedBox(
                  height: SizeConfig.getPercentageHeight(2),
                ),
                Text(
                  "A key phrase of twelve words will be given on creating a wallet. Make sure to back up this key phrase, you are also advised to store it manually as this would be required before you can access your wallet on a new device.",
                  textAlign: TextAlign.left,
                  style: titleStyle(context, false, size: 17),
                ),
                SizedBox(
                  height: SizeConfig.getPercentageHeight(2),
                ),
                Text(
                  "N/B: You can’t access your wallet without the key phrase",
                  textAlign: TextAlign.left,
                  style: titleStyle(context, false, size: 17),
                ),
                SizedBox(
                  height: SizeConfig.getPercentageHeight(12),
                ),
                GestureDetector(
                  onTap: (() {
                    NavConfig.push(context, const CreateWalletScreen());
                  }),
                  child: Container(
                      padding: EdgeInsets.only(
                          left: SizeConfig.getPercentageWidth(8)),
                      child: CustomButton(
                        text: "Continue",
                        isColored: true,
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
