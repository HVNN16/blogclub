import 'package:flutter/material.dart';

import '../constant.dart';

class AboutProfileBox extends StatelessWidget {
  const AboutProfileBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            width: double.infinity,
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
              boxShadow:[
                BoxShadow(
                  blurRadius: 20,
                  color: greyColor.withOpacity(0.2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: primaryColor.withOpacity(0.5),
                              width: 2.5),
                          borderRadius: BorderRadius.circular(25)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                            "assets/img/stories/story_8.jpg"),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("@SajjadDev"),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Sajjad Abbasi",
                          style:
                          Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Mobile Developer",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .apply(color: primaryColor),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "About me",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Madison Blackstone is a director of user experience design, with experience managing global teams.",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .apply(color: greyColor),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 50,
            right: 50,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0xff2151CD),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "52",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .apply(color: Colors.white),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Posts",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                  fontSize: 13,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "252",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .apply(color: Colors.white),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Following",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "4.5K",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .apply(color: Colors.white),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              "Followers",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.white),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
