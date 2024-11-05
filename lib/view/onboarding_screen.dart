import 'package:blog_club/constant.dart';
import 'package:blog_club/model/onboarding_model.dart';
import 'package:blog_club/view/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int page = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      if (_pageController.page!.round() != page) {
        setState(() {
          page = _pageController.page!.round();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xffFBFCFF),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 10),
              child: Image.asset("assets/img/background/onboarding.png"),
            ),
          ),
          Container(
            height: 260,
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 20, color: Colors.black.withOpacity(0.2)),
                ],
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              children: [
                Expanded(
                    child: PageView.builder(
                  itemCount: onBoardingItems.length,
                  controller: _pageController,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            onBoardingItems[index].title,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            onBoardingItems[index].description,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    );
                  },
                )),
                Container(
                  height: 60,
                  padding:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: onBoardingItems.length,
                        effect: ExpandingDotsEffect(
                          activeDotColor: primaryColor,
                          dotColor: primaryColor.withOpacity(0.2),
                          dotHeight: 10,
                          dotWidth: 10,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (page == onBoardingItems.length - 1) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const MainScreen(),
                                ));
                          }else {
                            _pageController.animateToPage(page+1, duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
                          }
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(primaryColor),
                            minimumSize:
                                MaterialStateProperty.all(const Size(80, 55)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)))),
                        child: Icon(page == onBoardingItems.length - 1
                            ? CupertinoIcons.check_mark
                            : CupertinoIcons.arrow_right),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
