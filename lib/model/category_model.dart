class Category {
  final int id;
  final String title;
  final String imageFileName;

  const Category({
    required this.id,
    required this.title,
    required this.imageFileName,
  });

  // From JSON
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      title: json['title'],
      imageFileName: json['imageFileName'],
    );
  }
}
