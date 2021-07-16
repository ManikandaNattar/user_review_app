import 'package:flutter/material.dart';
import 'package:user_review_app/user_review_post.dart';
import 'package:user_review_app/user_review_view_model.dart';

import 'api_service.dart';
import 'package:dio/dio.dart' as dio;

class UserReviewForm extends StatefulWidget {
  const UserReviewForm({Key? key}) : super(key: key);

  @override
  _UserReviewFormState createState() => _UserReviewFormState();
}

class _UserReviewFormState extends State<UserReviewForm> {
  UserReviewPost userReviewPost = UserReviewPost(body: '', title: '');
  UserReviewViewModel userReviewViewModel = UserReviewViewModel();
  final GlobalKey<FormState> _key = GlobalKey();
  Future<void> _onSubmit() async {
    _key.currentState!.save();
    ApiService apiService = ApiService(dio.Dio());
    await apiService.uploadPost({
      'body': userReviewPost.body,
      'title': userReviewPost.title,
    });
    setState(() {
      userReviewViewModel.setPost(userReviewPost);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Review Submitted Successfully',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User Review Form',
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _key,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Title',
                    ),
                    onSaved: (val) {
                      userReviewPost.title = val.toString();
                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Body',
                    ),
                    onSaved: (val) {
                      userReviewPost.body = val.toString();
                    },
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _onSubmit();
                    },
                    child: const Text(
                      'SUBMIT',
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    '{${userReviewViewModel.post.title}-${userReviewViewModel.post.body}}',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
