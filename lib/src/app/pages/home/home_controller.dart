import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

import 'package:devquiz/src/domain/entities/quiz_model.dart';
import 'package:devquiz/src/domain/entities/user_model.dart';
import 'package:devquiz/src/domain/usecases/get_quizzes.dart';
import 'package:devquiz/src/domain/usecases/get_user.dart';

enum HomeState {
  empty,
  loading,
  success,
  error,
}

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);

  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final _getUser = GetIt.instance.get<GetUser>();
  final _getQuizzes = GetIt.instance.get<GetQuizzes>();

  void start() async {
    state = HomeState.loading;

    await Future.delayed(Duration(seconds: 2));

    user = await _getUser();
    quizzes = await _getQuizzes();

    state = HomeState.success;
  }
}
