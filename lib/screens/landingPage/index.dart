import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kripto/config/navigator.dart';
import 'package:kripto/config/size.dart';
import 'package:kripto/screens/backup/index.dart';
import 'package:kripto/screens/import_screen.dart/index.dart';
import 'package:kripto/screens/widget/button.dart';
import 'package:kripto/utils/style.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.getPercentageHeight(22),
              ),
              Center(
                child: Container(
                    child: GestureDetector(
                  onTap: (() {
                    print("object");
                    // customAlertbox(context, false);
                  }),
                  child: Text(
                    "Your Kripto Account",
                    style: titleStyle(context, true, size: 30),
                  ),
                )),
              ),
              SizedBox(
                height: SizeConfig.getPercentageHeight(18),
              ),
              GestureDetector(
                onTap: (() {
                  NavConfig.push(context, const Backupscreen());
                }),
                child: CustomButton(
                  text: "Create Wallet",
                  isColored: true,
                ),
              ),
              SizedBox(
                height: SizeConfig.getPercentageHeight(3),
              ),
              GestureDetector(
                onTap: (() {
                  NavConfig.push(context, const ImportScreen());
                }),
                child: CustomButton(
                  text: "Import Wallet",
                  isColored: true,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
