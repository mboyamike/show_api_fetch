class Post {
  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
  
  final int userId;
  final int id;
  final String title;
  final String body;

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      userId: map['userId']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      body: map['body'] ?? '',
    );
  }
}
