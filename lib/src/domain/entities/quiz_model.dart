import 'dart:convert';

import 'package:devquiz/src/app/shared/utils/app_images.dart';
import 'package:devquiz/src/domain/entities/question_model.dart';

enum Level { easy, medium, hard, expert }

extension LevelStringExt on String {
  Level get parse => {
        "easy": Level.easy,
        "medium": Level.medium,
        "hard": Level.hard,
        "expert": Level.expert,
      }[this]!;
}

extension LevelExt on Level {
  String get parse => {
        Level.easy: "easy",
        Level.medium: "medium",
        Level.hard: "hard",
        Level.expert: "expert",
      }[this]!;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionsAnswered;
  final String image;
  final Level level;

  QuizModel({
    required this.title,
    required this.questions,
    this.questionsAnswered = 0,
    required this.image,
    required this.level,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionsAnswered': questionsAnswered,
      'image': image,
      'level': level.parse,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(
          map['questions'].map((x) => QuestionModel.fromMap(x))),
      questionsAnswered: map['questionsAnswered'],
      image: AppImages.blocks,
      level: map['level'].toString().parse,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}
