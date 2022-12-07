import 'package:flutter/material.dart';

class NavConfig {
  static Future<dynamic> irreversibleNavigate(BuildContext context, screen) {
    return Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => screen),
        (Route<dynamic> route) => false);
  }

  static Future<dynamic> reversibleNavigation(BuildContext context, screen) {
    return Navigator.push(context, MaterialPageRoute(builder: (context) {
      return screen;
    }));
  }
}
