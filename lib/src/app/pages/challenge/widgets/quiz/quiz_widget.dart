import 'package:flutter/material.dart';

import 'package:devquiz/src/app/pages/challenge/widgets/answer/answer_widget.dart';
import 'package:devquiz/src/app/shared/styles/styles.dart';

class QuizWidget extends StatelessWidget {
  final String title;

  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.heading,
          ),
          SizedBox(height: 24),
          AnswerWidget(
            title:
                'Possibilita a criação de aplicativos compilados nativamente',
          ),
          AnswerWidget(
            title:
                'Possibilita a criação de aplicativos compilados nativamente',
            isSelected: true,
            isRight: true,
          ),
          AnswerWidget(
            title:
                'Possibilita a criação de aplicativos compilados nativamente',
            isSelected: true,
          ),
        ],
      ),
    );
  }
}
