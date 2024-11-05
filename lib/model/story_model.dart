// lib/model/story_model.dart
class Story {
  final int id;
  final String name;
  final String imageFileName;
  final String iconFileName;
  final bool isViewed;

  Story({
    required this.id,
    required this.name,
    required this.imageFileName,
    required this.iconFileName,
    required this.isViewed,
  });

  factory Story.fromJson(Map<String, dynamic> json) {
    return Story(
      id: json['id'],
      name: json['name'],
      imageFileName: json['imageFileName'],
      iconFileName: json['iconFileName'],
      isViewed: json['isViewed'],
    );
  }
}
