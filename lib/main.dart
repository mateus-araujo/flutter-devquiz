import 'package:devquiz/src/bindings.dart';
import 'package:flutter/material.dart';

import 'package:devquiz/src/app/app_widget.dart';

void main() async {
  await setup();

  runApp(AppWidget());
}
