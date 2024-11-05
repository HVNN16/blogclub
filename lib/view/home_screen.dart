import 'package:blog_club/model/post_model.dart';
import 'package:blog_club/model/story_model.dart';
import 'package:flutter/material.dart';
import '../widget/category_slider.dart';
import '../widget/post_card.dart';
import '../widget/story_item.dart';
import 'package:blog_club/api_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService apiService = ApiService('https://api-blog-riin.onrender.com/stories');
  List<Story> stories = [];
  bool isLoading = true; // Loading state

  @override
  void initState() {
    super.initState();
    fetchStories(); // Fetch stories on init
  }

  Future<void> fetchStories() async {
    try {
      stories = await apiService.fetchStories(); // Fetch stories from API
    } catch (error) {
      // Handle error
      print("Error fetching stories: $error");
    } finally {
      setState(() {
        isLoading = false; // Update loading state
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? const Center(child: CircularProgressIndicator()) // Show loading indicator
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Hi, NghĩaEmiu!",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Image.asset(
                            "assets/img/icons/notification.png",
                            width: 35,
                            height: 35,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Title for stories
                      Text(
                        "Explore today's stories",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(height: 20),

                      // Stories List
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: stories.length,
                          itemBuilder: (context, index) {
                            return StoryItem(
                              story: stories[index],
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Category Slider
                      const CategorySlider(),
                      const SizedBox(height: 20),

                      // Latest News Section
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Latest News",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          TextButton(onPressed: () {}, child: const Text("More"))
                        ],
                      ),

                      // Display the posts list
                      ListView.builder(
                        itemCount: posts.length, // Use the posts list here
                        scrollDirection: Axis.vertical,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return PostCard(
                            post: posts[index], // Pass each post to PostCard
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
