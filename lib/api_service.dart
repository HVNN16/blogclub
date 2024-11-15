import 'dart:convert';
import 'package:blog_club/model/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:blog_club/model/category_model.dart';
import 'package:blog_club/model/story_model.dart';

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  // Fetch stories from the API
  Future<List<Story>> fetchStories() async {
    final response = await http.get(Uri.parse('$baseUrl/stories/api'));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Story.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load stories');
    }
  }

  // Fetch categories from the API
  Future<List<Category>> fetchCategories() async {
    final response = await http.get(Uri.parse('$baseUrl/categories/api'));

    if (response.statusCode == 200) {
      // If the server returns a successful response
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Category.fromJson(json)).toList();
    } else {
      // If the server returns an error response
      throw Exception('Failed to load categories');
    }
  }
  // Fetch Posts from the API
  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts/api'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
