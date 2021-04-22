import 'package:devquiz/src/app/pages/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:devquiz/src/app/pages/challenge/widgets/quiz/quiz_widget.dart';
import 'package:flutter/material.dart';

class ChallengeView extends StatefulWidget {
  @override
  _ChallengeViewState createState() => _ChallengeViewState();
}

class _ChallengeViewState extends State<ChallengeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: SafeArea(
            child: QuestionIndicatorWidget(),
          ),
        ),
        body: QuizWidget(
          title: 'O que o fluter faz em sua totalidade?',
        ));
  }
}
