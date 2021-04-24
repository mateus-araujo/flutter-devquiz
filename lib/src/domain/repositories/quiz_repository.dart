import 'package:devquiz/src/domain/entities/quiz_model.dart';

abstract class IQuizRepository {
  Future<List<QuizModel>> getQuizzes();
}
