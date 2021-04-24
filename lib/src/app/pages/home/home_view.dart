import 'package:flutter/material.dart';

import 'package:devquiz/src/app/pages/home/widgets/app_bar/app_bar_widget.dart';
import 'package:devquiz/src/app/pages/home/widgets/level_button/level_button_widget.dart';
import 'package:devquiz/src/app/pages/home/widgets/quiz_card/quiz_card_widget.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
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
                children: [
                  QuizCardWidget(),
                  QuizCardWidget(),
                  QuizCardWidget(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
