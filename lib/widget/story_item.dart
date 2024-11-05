import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../model/story_model.dart';
import '../view/profile_screen.dart';
class StoryItem extends StatelessWidget {
  final Story story;
  const StoryItem({
    super.key, required this.story,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen(),)),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 2,horizontal: 4),
        child: Column(
          children: [
            Stack(
              children: [
                story.isViewed?
                SizedBox(
                  width: 70,
                  height: 70,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    color: greyColor,
                    padding: const EdgeInsets.all(7),
                    dashPattern: const [5,3],
                    strokeWidth: 2,
                    radius: const Radius.circular(25),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(story.imageFileName),
                    ),
                  ),
                ):
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: const LinearGradient(
                        colors: [
                          Color(0xff376AED),
                          Color(0xff49B0E2),
                          Color(0xff9CECFB),
                        ],
                        begin: Alignment.topCenter
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)
                    ),
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.all(2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(story.imageFileName),
                    ),
                  ),
                ),
                Positioned(
                    right: 0,
                    bottom: 0,
                    child: Image.asset(story.iconFileName,width: 25,height: 25,)),
              ],
            ),
            Expanded(child: Text(story.name,style: Theme.of(context).textTheme.bodyMedium,))
          ],
        ),
      ),
    );
  }
}
