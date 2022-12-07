import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kripto/config/color.dart';
import 'package:kripto/config/size.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // void flagSwitch() {
  //   Timer(const Duration(seconds: 2), () {
  //     Navigator.pushAndRemoveUntil(context,
  //         MaterialPageRoute(builder: (context) {
  //       /*------------------------------------------------
  //       Here we'll navigate been on authentication status
  //       -------------------------------------------------*/
  //       return const Login();
  //     }), (Route<dynamic> route) => false);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    //  flagSwitch();

    return Scaffold(
      backgroundColor: ColorConfig.splash,
      body: Center(
        child: Image(
          image: AssetImage("assets/images/icons/Kripto.png"),
          height: SizeConfig.getPercentageWidth(40),
          width: SizeConfig.getPercentageWidth(40),
        ),
      ),
    );
  }
}
