import 'package:flutter/material.dart';

import 'package:devquiz/src/app/navigation/routes.dart';
import 'package:devquiz/src/app/shared/styles/colors.dart';

import 'home_controller.dart';
import 'widgets/app_bar/app_bar_widget.dart';
import 'widgets/level_button/level_button_widget.dart';
import 'widgets/quiz_card/quiz_card_widget.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();

    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.stateNotifier,
      builder: (context, value, child) {
        if (value == HomeState.success) {
          return Scaffold(
            appBar: AppBarWidget(
              user: controller.user!,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LevelButtonWidget.easy(),
                      LevelButtonWidget.medium(),
                      LevelButtonWidget.hard(),
                      LevelButtonWidget.expert(),
                    ],
                  ),
                  SizedBox(height: 24),
                  Expanded(
                    child: GridView.count(
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      crossAxisCount: 2,
                      children: controller.quizzes!
                          .map(
                            (quiz) => QuizCardWidget(
                              title: quiz.title,
                              image: quiz.image,
                              questionsAnswered: quiz.questionsAnswered,
                              questionsLength: quiz.questions.length,
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.CHALLENGE,
                                  arguments: quiz,
                                );
                              },
                            ),
                          )
                          .toList(),
                    ),
                  )
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
              ),
            ),
          );
        }
      },
    );
  }
}
