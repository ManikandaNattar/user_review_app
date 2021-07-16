class UserReviewPost {
  String body;
  String title;

  UserReviewPost({
    required this.body,
    required this.title,
  });

  UserReviewPost.fromMap(Map<String, dynamic> data, this.body, this.title) {
    body = data['body'];
    title = data['title'];
  }

  Map<String, dynamic> toMap() {
    return {
      'body': body,
      'title': title,
    };
  }
}
