import 'package:flutter/material.dart';

import 'package:devquiz/src/app/pages/result/result_view.dart';
import 'package:devquiz/src/domain/entities/quiz_model.dart';

import '../../navigation/routes.dart';
import 'controllers/challenge_controller.dart';
import 'widgets/next_button/next_button_widget.dart';
import 'widgets/question_indicator/question_indicator_widget.dart';
import 'widgets/quiz/quiz_widget.dart';

class ChallengeView extends StatefulWidget {
  final QuizModel quiz;

  const ChallengeView({Key? key, required this.quiz}) : super(key: key);

  @override
  _ChallengeViewState createState() => _ChallengeViewState();
}

class _ChallengeViewState extends State<ChallengeView> {
  final controller = ChallengeController();
  final pageController = PageController();

  void nextPage() async {
    if (controller.currentPage == widget.quiz.questions.length - 1) return;

    await Future.delayed(Duration(seconds: 1));

    pageController.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.linear,
    );
  }

  void onSelected(bool value) {
    if (!value) return;

    controller.qtdAnswersRight++;
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130),
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, child) {
                  return QuestionIndicatorWidget(
                    currentPage: value,
                    questionsLength: widget.quiz.questions.length,
                  );
                },
              )
            ],
          ),
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (value) => controller.currentPage = value,
        children: widget.quiz.questions
            .map(
              (question) => QuizWidget(
                question: question,
                onSelected: onSelected,
              ),
            )
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ValueListenableBuilder(
            valueListenable: controller.currentPageNotifier,
            builder: (context, value, _) {
              if (value == widget.quiz.questions.length - 1)
                return NextButtonWidget.green(
                  label: "Confirmar",
                  onTap: () => Navigator.pushReplacementNamed(
                    context,
                    Routes.RESULT,
                    arguments: ResultArguments(
                      quiz: widget.quiz,
                      qtdAnswersRight: controller.qtdAnswersRight,
                    ),
                  ),
                );
              else
                return NextButtonWidget.white(
                  label: "Pular",
                  onTap: nextPage,
                );
            },
          ),
        ),
      ),
    );
  }
}
