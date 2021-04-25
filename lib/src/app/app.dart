import 'package:flutter/material.dart';

import 'navigation/routes.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (context) => makeRoute(
            context: context,
            routeName: settings.name!,
            arguments: settings.arguments,
          ),
        );
      },
    );
  }
}
