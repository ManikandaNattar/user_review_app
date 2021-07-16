import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:user_review_app/user_review_form_response.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) {
    dio.options = BaseOptions(
        connectTimeout: 5000,
        receiveTimeout: 5000,
        contentType: 'application/json',
        headers: {'Accept': 'application/json'});

    return _ApiService(dio, baseUrl: baseUrl);
  }

  @POST('/posts')
  Future<UserReviewFormResponse> uploadPost(
    @Body() Map<String, dynamic> body,
  );
}
