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
      id: json['id'] ?? 0,  // Nếu id là null, gán giá trị mặc định là 0
      title: json['title'] ?? 'Unknown Category',  // Nếu title là null, gán giá trị mặc định
      imageFileName: json['imageFileName'] ?? 'default_image.jpg',  // Nếu imageFileName là null, gán giá trị mặc định
    );
  }
}
