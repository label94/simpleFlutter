/// 샘플 용 DTO 파일
class Posts {
  final int userId;
  final int id;
  final String title;
  final String body;

  // 이름 있는 매개변수 생성자 사용
  Posts({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  // 역직렬화
  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
    userId: json['userId'],
    id: json['id'],
    title: json['title'],
    body: json['body'],
  );

  // 직렬화
  Map<String, dynamic> toJson() => {
    'userId': userId,
    'id': id,
    'title': title,
    'body': body,
  };

}