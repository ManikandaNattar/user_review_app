import 'package:json_annotation/json_annotation.dart';

part 'user_review_form_response.g.dart';

@JsonSerializable()
class UserReviewFormResponse {
  @JsonKey(name: 'body')
  final String? body;

  @JsonKey(name: 'title')
  final String? title;

  UserReviewFormResponse({
    this.body,
    this.title,
  });

  factory UserReviewFormResponse.fromJson(Map<String, dynamic> json) =>
      _$UserReviewFormResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserReviewFormResponseToJson(this);
}
