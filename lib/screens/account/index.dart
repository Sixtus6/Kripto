import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kripto/config/color.dart';
import 'package:kripto/config/constant.dart';
import 'package:kripto/config/navigator.dart';
import 'package:kripto/config/size.dart';
import 'package:kripto/screens/account/signin/index.dart';
import 'package:kripto/screens/widget/button.dart';
import 'package:kripto/screens/widget/input-form.dart';
import 'package:kripto/utils/style.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: SizeConfig.getPercentageHeight(10),
            ),
            Center(
              child: Container(
                  child: Text(
                "Create an account",
                style: titleStyle(context, true, size: 30),
              )),
            ),
            SizedBox(
              height: SizeConfig.getPercentageHeight(7),
            ),
            CustomInput(
              emailController: emailController,
              secure: false,
              fieldname: 'Email',
              hint: "Enter Your Email",
              formicon: Icons.mail,
            ),
             CustomInput(
              emailController: usernameController,
              secure: false,
              fieldname: 'Username',
              hint: "Enter Username",
              formicon: Icons.account_circle,
            ),
            CustomInput(
              emailController: passwordController,
              secure: true,
              fieldname: 'Password',
              hint: "Enter Password",
              formicon: Icons.key_sharp,
            ),
            CustomInput(
              emailController: confirmpasswordController,
              secure: true,
              fieldname: 'Confirm Password',
              hint: "Enter Password",
              formicon: Icons.key_sharp,
            ),
           
            SizedBox(
              height: SizeConfig.getPercentageHeight(8),
            ),
            GestureDetector(
                onTap: () {
                  NavConfig.pushAndReplace(context, const Signinscreen());
                },
                child: CustomButton(
                  text: "Continue",
                  isColored: true,
                )),
            SizedBox(
              height: SizeConfig.getPercentageHeight(3),
            ),
          ]),
        ),
      ),
    );
  }
}
