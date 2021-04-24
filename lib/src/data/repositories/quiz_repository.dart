import 'dart:convert';

import 'package:flutter/services.dart';

import 'package:devquiz/src/domain/entities/quiz_model.dart';
import 'package:devquiz/src/domain/repositories/quiz_repository.dart';

class QuizRepository implements IQuizRepository {
  @override
  Future<List<QuizModel>> getQuizzes() async {
    final response = await rootBundle.loadString("assets/json/quizzes.json");

    final list = jsonDecode(response) as List;
    final quizzes = list.map((quiz) => QuizModel.fromMap(quiz)).toList();

    return quizzes;
  }
}
