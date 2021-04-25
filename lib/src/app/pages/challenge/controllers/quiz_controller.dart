import 'package:flutter/material.dart';

class QuizController {
  final selectedIndexNotifier = ValueNotifier<int>(-1);

  int get selectedIndex => selectedIndexNotifier.value;
  set selectedIndex(int value) => selectedIndexNotifier.value = value;
}
