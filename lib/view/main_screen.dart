import 'package:blog_club/constant.dart';
import 'package:blog_club/view/article_screen.dart';
import 'package:blog_club/view/home_screen.dart';
import 'package:blog_club/view/profile_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTab = 0;
  List screens = [
    const HomeScreen(),
    const ArticleScreen(),
    const Scaffold(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: 65,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: const Color(0x009B8487).withOpacity(.3),
                  )
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BottomNavItem(
                      title: "Home",
                      icon: "assets/img/icons/Home.png",
                      activeIcon: "assets/img/icons/HomeActive.png",
                      isActive: currentTab == 0,
                      onTap: () {
                        setState(() {
                          currentTab = 0;
                        });
                      },
                    ),
                    BottomNavItem(
                      title: "Articles",
                      icon: "assets/img/icons/Articles.png",
                      activeIcon: "assets/img/icons/ArticlesActive.png",
                      isActive: currentTab == 1,
                      onTap: () {
                        setState(() {
                          currentTab = 1;
                        });
                      },
                    ),
                    const Expanded(child: SizedBox()),
                    BottomNavItem(
                      title: "Search",
                      icon: "assets/img/icons/Search.png",
                      activeIcon: "assets/img/icons/SearchActive.png",
                      isActive: currentTab == 2,
                      onTap: () {
                        setState(() {
                          currentTab = 2;
                        });
                      },
                    ),
                    BottomNavItem(
                      title: "Menu",
                      icon: "assets/img/icons/Menu.png",
                      activeIcon: "assets/img/icons/MenuActive.png",
                      isActive: currentTab == 3,
                      onTap: () {
                        setState(() {
                          currentTab = 3;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 4),
                    shape: BoxShape.circle,
                    color: primaryColor),
                child: Image.asset("assets/img/icons/plus.png"),
              ),
            ),
          ],
        ),
      ),
      body: screens[currentTab],
    ));
  }
}

class BottomNavItem extends StatelessWidget {
  final String icon;
  final String title;
  final String activeIcon;
  final bool isActive;
  final Function() onTap;

  const BottomNavItem({
    super.key,
    required this.icon,
    required this.title,
    required this.activeIcon,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            isActive ? activeIcon : icon,
            width: 30,
            height: 30,
            scale: 0.9,
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            title,
            style: isActive
                ? Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: primaryColor)
                : Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    ));
  }
}
