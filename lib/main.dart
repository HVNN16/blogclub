import 'package:blog_club/view/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Blog Club",
      debugShowCheckedModeBanner: false,
      scrollBehavior: const CupertinoScrollBehavior(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: false,
        fontFamily: "Avenir",
        textTheme: const TextTheme(
          titleSmall: TextStyle(
            fontFamily: "Avenir",
            color: primaryTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          titleMedium: TextStyle(
            fontFamily: "Avenir",
            color: secondaryTextColor,
            fontSize: 18,
            fontWeight: FontWeight.w200,
          ),
          titleLarge: TextStyle(
            fontFamily: "Avenir",
            fontWeight: FontWeight.bold,
            color: primaryTextColor,
            fontSize: 18,
          ),
          headlineMedium: TextStyle(
            fontFamily: "Avenir",
            fontWeight: FontWeight.w700,
            fontSize: 24,
            color: primaryTextColor,
          ),
          headlineSmall: TextStyle(
            fontFamily: "Avenir",
            fontSize: 20,
            color: primaryTextColor,
            fontWeight: FontWeight.w700,
          ),
          bodyMedium: TextStyle(
            fontFamily: "Avenir",
            color: secondaryTextColor,
            fontSize: 12,
          ),
          bodySmall: TextStyle(
            fontFamily: "Avenir",
            fontWeight: FontWeight.w700,
            fontSize: 10,
            color: Color(0xff7B8BB2),
          ),
          bodyLarge: TextStyle(
            fontFamily: "Avenir",
            color: primaryTextColor,
            fontSize: 14,
          ),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}

