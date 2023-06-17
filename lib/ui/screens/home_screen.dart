import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utility/colors.dart';
import 'auth_module/create_account_screen.dart';
import 'auth_module/login_screen.dart';
import '../widgets/remark_title.dart';
import '../widgets/card_widgets/quiz_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Image.asset("assets/images/banner-logo.png"),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            RemarkTitle(
              label: "Live Quizzes",
              onSeeAllTap: () {},
            ),
            const SizedBox(
              height: 8.0,
            ),
            Visibility(
              visible: true,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [for (var i = 0; i <= 5; i++) const QuizCard()],
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            RemarkTitle(
              label: "All Quizzes",
              onSeeAllTap: () {},
            ),
            const SizedBox(
              height: 8.0,
            ),
            Visibility(
              visible: true,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [for (var i = 0; i <= 5; i++) const QuizCard()],
                ),
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            const Text(
              "Sign in or create an account\n to attend any of the Quiz",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: colorPrimary,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Get.to(LoginScreen());
                    },
                    child: const Text("Sign In"),
                  ),
                ),
                const SizedBox(width: 8.0,),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Get.to(CreateAccountScreen());
                    },
                    child: const Text("Create Account"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
