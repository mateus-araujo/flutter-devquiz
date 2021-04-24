import 'package:flutter/material.dart';

import 'package:devquiz/src/app/shared/styles/styles.dart';
import 'package:devquiz/src/app/shared/utils/app_images.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.linear,
        ),
        child: Center(
          child: Image.asset(AppImages.logo),
        ),
      ),
    );
  }
}
