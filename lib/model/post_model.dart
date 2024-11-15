class Post {
  final int id;
  final String caption;
  final String title;
  final String likes;
  final String time;
  final bool isBookmarked;
  final String imageFileName;

  const Post({
    required this.id,
    required this.caption,
    required this.title,
    required this.likes,
    required this.time,
    required this.isBookmarked,
    required this.imageFileName,
  });

  // Factory constructor to create Post from JSON
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] ,
      caption: json['caption'],
      title: json['title'],
      likes: json['likes'],
      time: json['time'],
      isBookmarked: json['isBookmarked'],
      imageFileName: json['imageFileName'],
    );
  }
}
