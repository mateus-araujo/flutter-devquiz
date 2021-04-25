import 'package:flutter/material.dart';

import 'package:devquiz/src/app/shared/styles/styles.dart';
import 'package:devquiz/src/domain/entities/answer_model.dart';
import 'package:devquiz/src/domain/entities/question_model.dart';

import '../../controllers/quiz_controller.dart';
import '../answer/answer_widget.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;

  const QuizWidget({
    Key? key,
    required this.question,
    required this.onSelected,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  final controller = QuizController();

  AnswerModel getAnswerByIndex(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 25),
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(height: 24),
          Expanded(
            child: ValueListenableBuilder<int>(
              valueListenable: controller.selectedIndexNotifier,
              builder: (context, value, child) => ListView.builder(
                itemCount: widget.question.answers.length,
                itemBuilder: (context, index) => AnswerWidget(
                  answer: getAnswerByIndex(index),
                  isSelected: value == index,
                  disabled: value != -1,
                  onTap: (value) {
                    controller.selectedIndex = index;
                    widget.onSelected(value);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
