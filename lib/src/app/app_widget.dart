import 'package:devquiz/src/app/pages/challenge/challenge_view.dart';
import 'package:devquiz/src/app/pages/home/home_view.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      home: ChallengeView(),
    );
  }
}
