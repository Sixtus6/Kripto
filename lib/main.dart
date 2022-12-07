import 'package:flutter/material.dart';
import 'package:kripto/features/mainscreen.dart';
import 'package:kripto/provider/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeClass.mainTheme,
      home: const MainScreen(),
    );
  }
}
