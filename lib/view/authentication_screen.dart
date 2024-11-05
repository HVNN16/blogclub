import 'package:blog_club/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  static const loginTab = 0;
  static const signTab = 1;

  int selectedTabIndex = loginTab;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 32),
            child: SvgPicture.asset(
              "assets/img/icons/LOGO.svg",
              width: 130,
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                            onPressed: () {
                              setState(() {
                                selectedTabIndex = loginTab;
                              });
                            },
                            child: Text(
                              "LOGIN",
                              style:
                                  theme.titleLarge!.apply(color: selectedTabIndex==loginTab?Colors.white:Colors.white70),
                            )),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                selectedTabIndex=signTab;
                              });
                            },
                            child: Text(
                              "SIGN UP",
                              style:
                                  theme.titleLarge!.apply(color: selectedTabIndex==signTab?Colors.white:Colors.white70),
                            ))
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: backgroundColor,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30))),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: selectedTabIndex==loginTab? _Login(theme: theme):_SignUp(theme: theme),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class _Login extends StatelessWidget {
  const _Login({
    required this.theme,
  });

  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome Back",
          style: theme.headlineMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Sign in with your account",
          style: theme.titleSmall,
        ),
        const SizedBox(
          height: 18,
        ),
        const TextField(
          decoration: InputDecoration(label: Text("UserName")),
        ),
        const SizedBox(
          height: 6,
        ),
        const PasswordTextField(),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.sizeOf(context).width, 60)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)))),
            onPressed: () {},
            child: const Text("LOGIN")),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Forgot your password?"),
            const SizedBox(
              width: 10,
            ),
            TextButton(onPressed: () {}, child: const Text("Reset here")),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        const Center(
          child: Text(
            "OR SIGN IN WITH",
            style: TextStyle(letterSpacing: 2),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/img/icons/Google.png",
              width: 40,
            ),
            const SizedBox(
              width: 20,
            ),
            Image.asset(
              "assets/img/icons/Facebook.png",
              width: 40,
            ),
            const SizedBox(
              width: 20,
            ),
            Image.asset(
              "assets/img/icons/Twitter.png",
              width: 40,
            ),
          ],
        ),
      ],
    );
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({
    required this.theme,
  });

  final TextTheme theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome to blog club",
          style: theme.headlineMedium,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          "Please enter your information",
          style: theme.titleSmall,
        ),
        const SizedBox(
          height: 18,
        ),
        const TextField(
          decoration: InputDecoration(label: Text("FullName")),
        ),
        const SizedBox(
          height: 6,
        ),
        const TextField(
          decoration: InputDecoration(label: Text("UserName")),
        ),
        const SizedBox(
          height: 6,
        ),
        const PasswordTextField(),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                    Size(MediaQuery.sizeOf(context).width, 60)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)))),
            onPressed: () {},
            child: const Text("SIGN UP")),
        const SizedBox(
          height: 25,
        ),
        const Center(
          child: Text(
            "OR SIGN UP WITH",
            style: TextStyle(letterSpacing: 2),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/img/icons/Google.png",
              width: 40,
            ),
            const SizedBox(
              width: 20,
            ),
            Image.asset(
              "assets/img/icons/Facebook.png",
              width: 40,
            ),
            const SizedBox(
              width: 20,
            ),
            Image.asset(
              "assets/img/icons/Twitter.png",
              width: 40,
            ),
          ],
        ),
      ],
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      enableSuggestions: true,
      autocorrect: false,
      decoration: InputDecoration(
          label: const Text("Password"),
          suffixIcon: TextButton(
              onPressed: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child: Text(obscureText ? "Show" : "Hide"))),
    );
  }
}
