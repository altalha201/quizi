import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              child: Visibility(
                visible: true,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (var i = 0; i <= 4; i++) const QuizCard()
                    ],
                  ),
                ),
              ),
            ),
            RemarkTitle(
              label: "All Quizzes",
              onSeeAllTap: () {},
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              child: Visibility(
                visible: true,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (var i = 0; i <= 5; i++)
                        const QuizCard()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Login"),
        onPressed: () {
          Get.to(const LoginScreen());
        },
      ),
    );
  }
}