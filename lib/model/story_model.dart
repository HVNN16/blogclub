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
      id: json['id'] ?? 0,  // Nếu không có giá trị cho id, gán mặc định là 0
      name: json['name'] ?? 'Unknown',  // Nếu name là null, gán mặc định là 'Unknown'
      imageFileName: json['imageFileName'] ?? '',  // Nếu không có imageFileName, gán chuỗi rỗng
      iconFileName: json['iconFileName'] ?? '',  // Nếu không có iconFileName, gán chuỗi rỗng
      isViewed: json['isViewed'] ?? false,  // Nếu không có isViewed, gán mặc định là false
    );
  }
}
