import 'package:flutter/material.dart';

import 'package:devquiz/src/app/shared/styles/styles.dart';
import 'package:devquiz/src/app/shared/widgets/progress_indicator/progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentPage;
  final int questionsLength;

  const QuestionIndicatorWidget({
    Key? key,
    required this.currentPage,
    required this.questionsLength,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                currentPage < 10
                    ? "Questão 0${currentPage + 1}"
                    : "Questão ${currentPage + 1}",
                style: AppTextStyles.body,
              ),
              Text(
                "de $questionsLength",
                style: AppTextStyles.body,
              ),
            ],
          ),
          SizedBox(height: 16),
          ProgressIndicatorWidget(value: currentPage / questionsLength),
        ],
      ),
    );
  }
}
