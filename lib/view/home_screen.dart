import 'package:flutter/material.dart';
import 'package:blog_club/api_service.dart';
import 'package:blog_club/model/category_model.dart';
import 'package:blog_club/model/story_model.dart';
import 'package:blog_club/widget/category_slider.dart';
import 'package:blog_club/widget/story_item.dart';
import 'package:blog_club/widget/post_card.dart'; // Assuming you also have this widget

import '../model/post_model.dart'; // Import the Post model

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ApiService apiService = ApiService('http://localhost:8080');
  List<Category> categories = [];
  List<Story> stories = [];
  List<Post> posts = [];  // List to store posts
  bool isLoadingCategories = true;
  bool isLoadingStories = true;
  bool isLoadingPosts = true; // Loading state for posts

  @override
  void initState() {
    super.initState();
    fetchCategories(); // Fetch categories on init
    fetchStories(); // Fetch stories if you are still using them
    fetchPosts(); // Fetch posts from the API
  }

  // Fetch categories
  Future<void> fetchCategories() async {
    try {
      categories = await apiService.fetchCategories(); // Fetch categories
    } catch (error) {
      print("Error fetching categories: $error");
    } finally {
      setState(() {
        isLoadingCategories = false; // Update category loading state
      });
    }
  }

  // Fetch stories
  Future<void> fetchStories() async {
    try {
      stories = await apiService.fetchStories(); // Fetch stories from API
    } catch (error) {
      print("Error fetching stories: $error");
    } finally {
      setState(() {
        isLoadingStories = false; // Update loading state for stories
      });
    }
  }

  // Fetch posts
  Future<void> fetchPosts() async {
    try {
      posts = await apiService.fetchPosts(); // Fetch posts from the API
    } catch (error) {
      print("Error fetching posts: $error");
    } finally {
      setState(() {
        isLoadingPosts = false; // Update loading state for posts
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isLoadingCategories || isLoadingStories || isLoadingPosts
            ? const Center(child: CircularProgressIndicator()) // Show loading spinner
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

                      // Stories List (If needed)
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: stories.length,
                          itemBuilder: (context, index) {
                            return StoryItem(story: stories[index]);
                          },
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Category Slider
                      categories.isEmpty
                          ? const Center(child: CircularProgressIndicator())
                          : CategorySlider(categories: categories), // Pass categories to CategorySlider

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
                        itemCount: posts.length,
                        scrollDirection: Axis.vertical,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return PostCard(post: posts[index]); // Display each post
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
