import 'package:flutter/material.dart';

import 'package:devquiz/src/domain/entities/quiz_model.dart';

import '../pages/challenge/challenge_view.dart';
import '../pages/home/home_view.dart';
import '../pages/result/result_view.dart';
import '../pages/splash/splash_view.dart';

class Routes {
  static const SPLASH = '/';
  static const HOME = '/home';
  static const CHALLENGE = '/challenge';
  static const RESULT = '/result';
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
    case Routes.SPLASH:
      return SplashView();
    case Routes.HOME:
      return HomeView();
    case Routes.CHALLENGE:
      final quiz = arguments as QuizModel;

      return ChallengeView(quiz: quiz);
    case Routes.RESULT:
      final result = (arguments as ResultArguments);

      return ResultView(
        quiz: result.quiz,
        qtdAnswersRight: result.qtdAnswersRight,
      );
    default:
      throw 'Route $routeName is not defined';
  }
}
