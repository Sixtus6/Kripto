import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kripto/config/color.dart';
import 'package:kripto/config/navigator.dart';
import 'package:kripto/config/size.dart';
import 'package:kripto/screens/landingPage/index.dart';
import 'package:kripto/screens/widget/alertbox.dart';
import 'package:kripto/screens/widget/button.dart';
import 'package:kripto/screens/widget/input-form.dart';
import 'package:kripto/utils/style.dart';

class Signinscreen extends StatefulWidget {
  const Signinscreen({super.key});

  @override
  State<Signinscreen> createState() => _SigninscreenState();
}

class _SigninscreenState extends State<Signinscreen> {
  TextEditingController emailControllerSignin = TextEditingController();
  TextEditingController passwordControllerSigin = TextEditingController();

  void customAlertbox(BuildContext context, bool mail) {
    showDialog(
        //  barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return mail
              ? AlertDialog(
                  // iconColor: ic,
                  //  insetPadding: EdgeInsets.symmetric(horizontal: 6),
                  // contentPadding: EdgeInsets.zero,

                  backgroundColor: Colors.transparent,
                  content: AlertPopUp(
                    arrow: true,
                    centericon: Icons.mail,
                    bottomText:
                        "Check your email for a link to confirm your mail",
                    topText: 'Verify your email',
                  ),
                )
              : AlertDialog(
                  // iconColor: ic,
                  //  insetPadding: EdgeInsets.symmetric(horizontal: 6),
                  // contentPadding: EdgeInsets.zero,

                  backgroundColor: Colors.transparent,
                  content: AlertPopUp(
                    arrow: false,
                    //centericon: Icons.mail,
                    bottomText:
                        "Check your email for a link to confirm your mail",
                    topText: 'Email Verified',
                  ),
                );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: SizeConfig.getPercentageHeight(20),
          ),
          Center(
            child: Container(
                child: GestureDetector(
              onTap: (() {
                print("object");
                customAlertbox(context, true);
              }),
              child: Text(
                "Sign in",
                style: titleStyle(context, true, size: 30),
              ),
            )),
          ),
          SizedBox(
            height: SizeConfig.getPercentageHeight(7),
          ),
          CustomInput(
            emailController: emailControllerSignin,
            secure: false,
            fieldname: 'Email',
            hint: "Enter Your Email",
            formicon: Icons.mail,
          ),
          CustomInput(
            emailController: passwordControllerSigin,
            secure: true,
            fieldname: 'Password',
            hint: "Enter Password",
            formicon: Icons.key_sharp,
          ),
          SizedBox(
            height: SizeConfig.getPercentageHeight(15),
          ),
          GestureDetector(
              onTap: () {
                

                NavConfig.pushAndReplace(context, const LandingPage());
              },
              child: CustomButton(
                text: "Sign in",
                isColored: true,
              )),
          SizedBox(
            height: SizeConfig.getPercentageHeight(3),
          ),
        ]),
      ),
    );
  }
}
