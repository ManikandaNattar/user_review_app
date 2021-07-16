import 'package:user_review_app/user_review_post.dart';

class UserReviewViewModel {
  UserReviewPost _userReviewPost = UserReviewPost(body: '', title: '');

  setPost(UserReviewPost userReviewPost) {
    _userReviewPost = userReviewPost;
  }

  UserReviewPost get post => _userReviewPost;
}
