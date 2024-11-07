class Category {
  final int id;
  final String title;
  final String imageFileName;

  const Category({
    required this.id,
    required this.title,
    required this.imageFileName,
  });

  // Factory method to convert JSON into a Category object
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      title: json['title'],
      imageFileName: json['imageFileName'],  // Image file URL or path
    );
  }
}
