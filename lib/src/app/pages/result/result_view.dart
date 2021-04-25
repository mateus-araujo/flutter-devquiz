import 'package:flutter/material.dart';

import 'package:devquiz/src/app/shared/styles/text_styles.dart';
import 'package:devquiz/src/app/shared/utils/app_images.dart';
import 'package:devquiz/src/domain/entities/quiz_model.dart';

import '../challenge/widgets/next_button/next_button_widget.dart';

class ResultView extends StatelessWidget {
  final QuizModel quiz;
  final int qtdAnswersRight;

  const ResultView({
    Key? key,
    required this.quiz,
    required this.qtdAnswersRight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(AppImages.trophy),
              Column(
                children: [
                  Text(
                    "Parabéns!",
                    style: AppTextStyles.heading40,
                  ),
                  SizedBox(height: 16),
                  Text.rich(
                    TextSpan(
                      text: "Você concluiu",
                      style: AppTextStyles.body,
                      children: [
                        TextSpan(
                          text: "\n${quiz.title}",
                          style: AppTextStyles.bodyBold,
                        ),
                        TextSpan(
                          text:
                              "\ncom $qtdAnswersRight de ${quiz.questions.length} acertos.",
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: NextButtonWidget.purple(
                          label: 'Compartilhar',
                          onTap: () => Navigator.pop(
                            context,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(children: [
                    Expanded(
                      child: NextButtonWidget.white(
                        label: 'Voltar ao início',
                        onTap: () => Navigator.pop(
                          context,
                        ),
                      ),
                    )
                  ]),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResultArguments {
  final QuizModel quiz;
  final int qtdAnswersRight;

  ResultArguments({
    required this.quiz,
    required this.qtdAnswersRight,
  });
}
