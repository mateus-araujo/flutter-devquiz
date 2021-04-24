import 'package:devquiz/src/domain/entities/quiz_model.dart';
import 'package:devquiz/src/domain/repositories/quiz_repository.dart';

abstract class IGetQuizzes {
  Future<List<QuizModel>> call();
}

class GetQuizzes implements IGetQuizzes {
  IQuizRepository _quizRepository;

  GetQuizzes(this._quizRepository);

  @override
  Future<List<QuizModel>> call() {
    final quizzes = _quizRepository.getQuizzes();

    return quizzes;
  }
}
