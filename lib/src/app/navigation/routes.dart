import 'package:flutter/material.dart';

import 'package:devquiz/src/domain/entities/question_model.dart';

import '../pages/challenge/challenge_view.dart';
import '../pages/home/home_view.dart';

class Routes {
  static const HOME = '/';
  static const CHALLENGE = '/challenge';
}

Widget makeRoute({
  required BuildContext context,
  required String routeName,
  Object? arguments,
}) {
  final Widget child = _buildRoute(
    context: context,
    routeName: routeName,
    arguments: arguments,
  );

  return child;
}

Widget _buildRoute({
  required BuildContext context,
  required String routeName,
  Object? arguments,
}) {
  switch (routeName) {
    case Routes.HOME:
      return HomeView();
    case Routes.CHALLENGE:
      final questions = arguments as List<QuestionModel>;
      return ChallengeView(questions: questions);
    default:
      throw 'Route $routeName is not defined';
  }
}
