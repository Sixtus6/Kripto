import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kripto/config/color.dart';
import 'package:kripto/config/navigator.dart';
import 'package:kripto/config/size.dart';
import 'package:kripto/screens/account/index.dart';
import 'package:kripto/screens/widget/button.dart';
import 'package:kripto/utils/style.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = PageController();
  List data = [
    {
      "title": "Buy Tokens",
      "subject":
          "You can buy a wide range of tokens from any blockchain at affordable cost and low gas fees.",
      "image": "assets/images/splash/token.png",
    },
    {
      "title": "Easy To Use",
      "subject":
          "It's just like any other wallet that you use for your day-to-day transactions.",
      "image": "assets/images/splash/easy2.png",
    },
    {
      "title": "Secured",
      "subject":
          "Highly secure. it's just a matter of securing your private key,shared private keys could lead to funds theft. ",
      "image": "assets/images/splash/mainseured.png",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.getPercentageWidth(150),
                child: PageView(controller: controller, children: [
                  ...List.generate(
                      data.length,
                      ((index) => onboardingWidget(
                          title: data[index]['title'],
                          subject: data[index]['subject'],
                          image: data[index]['image']))),
                ]),
              ),
              Center(
                  child: SmoothPageIndicator(
                controller: controller,
                count: data.length,
                effect: WormEffect(
                    dotHeight: SizeConfig.getPercentageWidth(3),
                    dotWidth: SizeConfig.getPercentageWidth(3),
                    spacing: 10,
                    dotColor: ColorConfig.dotColor,
                    activeDotColor: ColorConfig.splash),
              )),
              SizedBox(
                height: SizeConfig.getPercentageHeight(5),
              ),
              GestureDetector(
                onTap: (() {
                  NavConfig.pushAndReplace(context, const CreateAccount());
                }),
                child: CustomButton(
                  text: 'Create Account',
                  isColored: true,
                ),
              ),
              SizedBox(
                height: SizeConfig.getPercentageHeight(3),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: titleStyle(context, false, size: 18),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      print("object");
                      print(data[0].toString());
                    },
                    child: Text(
                      "Sign in",
                      style: titleStyle(context, false,
                          size: 18, color: ColorConfig.splash),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class onboardingWidget extends StatelessWidget {
  const onboardingWidget({
    Key? key,
    required this.title,
    required this.subject,
    required this.image,
  }) : super(key: key);
  final String title;
  final String subject;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Column(
        /* -------------------------------------------------------------------------- */
        /*                                    Text                                    */
        /* -------------------------------------------------------------------------- */
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: SizeConfig.getPercentageHeight(8),
          ),
          Container(
              margin: EdgeInsets.only(left: SizeConfig.getPercentageWidth(8)),
              child: Text(
                title,
                style: titleStyle(context, true),
              )),
          SizedBox(
            height: SizeConfig.getPercentageHeight(4),
          ),
          Container(
              margin: EdgeInsets.only(left: SizeConfig.getPercentageWidth(8)),
              child: Text(
                subject,
                style: titleStyle(context, false, size: 18),
              )),
          SizedBox(
            height: SizeConfig.getPercentageHeight(15),
          ),
          /* -------------------------------------------------------------------------- */
          /*                                    image                                   */
          /* -------------------------------------------------------------------------- */
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: SizeConfig.getPercentageWidth(60),
                width: SizeConfig.getPercentageWidth(60),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          )
        ]);
  }
}
