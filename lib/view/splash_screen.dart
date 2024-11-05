import 'package:blog_club/view/main_screen.dart';
import 'package:blog_club/view/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) =>
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => const OnBoardingScreen(),)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset(
            "assets/img/background/splash.png", fit: BoxFit.cover,)),
          Center(
            child: SvgPicture.asset("assets/img/icons/LOGO.svg"),
          ),
        ],
      ),
    ));
  }
}
