import 'package:flutter/material.dart';
import 'package:user_review_app/user_review_form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Review Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UserReviewForm(),
    );
  }
}
