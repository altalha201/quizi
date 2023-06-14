import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui/screens/splash_screen.dart';
import 'ui/utility/theme_data.dart';

void main() {
  runApp(const QuizI());
}

class QuizI extends StatelessWidget {
  const QuizI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "QuizI",
      debugShowCheckedModeBanner: false,
      theme: quizITheme(),
      home: const SplashScreen(),
    );
  }
}
