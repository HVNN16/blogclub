import 'package:flutter/material.dart';
import 'package:blog_club/widget/post_card.dart';
import 'package:blog_club/view/authentication_screen.dart'; 
import 'package:blog_club/constant.dart';
import '../model/post_model.dart';  // Import Post model
import '../widget/about_profile_box.dart';
import '../api_service.dart';  // Import ApiService

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ApiService apiService = ApiService('https://api-blog-riin.onrender.com');  // Your API URL
  List<Post> posts = [];
  bool isLoading = true; // Loading state

  @override
  void initState() {
    super.initState();
    fetchPosts(); // Fetch posts on init
  }

  // Fetch posts from the API
  Future<void> fetchPosts() async {
    try {
      posts = await apiService.fetchPosts(); // Fetch posts using ApiService
    } catch (error) {
      print("Error fetching posts: $error");
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
          ? const Center(child: CircularProgressIndicator())  // Show loading spinner while posts are loading
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                    child: Row(
                      children: [
                        Text(
                          "Profile",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const Spacer(),
                        IconButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context, 
                            //   MaterialPageRoute(builder: (context) => const AuthenticationScreen()),
                            // );
                          },
                          icon: const Icon(Icons.more_vert, size: 35),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const AboutProfileBox(),
                  const SizedBox(height: 40),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(30),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("My Post", style: Theme.of(context).textTheme.headlineSmall),
                            const Spacer(),
                            IconButton(onPressed: () {}, icon: const Icon(Icons.grid_view, color: primaryColor)),
                            IconButton(onPressed: () {}, icon: const Icon(Icons.list)),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // Display posts using the PostCard widget
                        for (var post in posts) PostCard(post: post),
                      ],
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
