import 'package:get_it/get_it.dart';

import 'package:devquiz/src/data/repositories/quiz_repository.dart';
import 'package:devquiz/src/data/repositories/user_repository.dart';
import 'package:devquiz/src/domain/usecases/get_quizzes.dart';
import 'package:devquiz/src/domain/usecases/get_user.dart';

Future<void> setup() async {
  GetIt.instance.registerLazySingleton<GetUser>(() {
    final repository = UserRepository();
    final getUser = GetUser(repository);

    return getUser;
  });

  GetIt.instance.registerLazySingleton<GetQuizzes>(() {
    final repository = QuizRepository();
    final getQuizzes = GetQuizzes(repository);

    return getQuizzes;
  });
}
