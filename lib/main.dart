import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'store_binding.dart';
import 'ui/screens/splash_screen.dart';
import 'ui/utility/theme_data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      initialBinding: StoreBinding(),
      home: const SplashScreen(),
    );
  }
}
