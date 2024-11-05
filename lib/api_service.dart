import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:blog_club/model/story_model.dart';

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<List<Story>> fetchStories() async {
    final response = await http.get(Uri.parse(baseUrl));
    
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((json) => Story.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load stories');
    }
  }
}
