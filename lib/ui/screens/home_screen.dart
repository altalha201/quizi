import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/quiz_module/get_quizzes_controller.dart';
import '../utility/colors.dart';
import '../widgets/appbars/logo_appbar.dart';
import '../widgets/loading_widget.dart';
import 'auth_module/create_account_screen.dart';
import 'auth_module/login_screen.dart';
import '../widgets/remark_title.dart';
import '../widgets/card_widgets/quiz_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Get.find<GetQuizzesController>().getQuizzes();
      await Get.find<GetQuizzesController>().getLiveQuizzes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: logoAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            RemarkTitle(label: "Available Quizzes", onSeeAllTap: () {}),
            Expanded(
              child: GetBuilder<GetQuizzesController>(
                  builder: (listController) {
                    if (listController.gettingNormalQuizzes) {
                      return const LoadingWidget();
                    }
                    return ListView.builder(
                        itemCount: listController.quizzes.length > 5 ? 5 : listController.quizzes.length,
                        itemBuilder: (context, index) {
                          return QuizCard(isLive: false, nQuiz: listController.quizzes.elementAt(index), isStudent: false,);
                        }
                    );
                  }
              ),
            ),
            const SizedBox(height: 16.0,),
            RemarkTitle(label: "Available Live Quizzes", onSeeAllTap: () {}),
            Expanded(
              child: GetBuilder<GetQuizzesController>(
                  builder: (listController) {
                    if (listController.gettingLiveQuizzes) {
                      return const LoadingWidget();
                    }
                    return ListView.builder(
                        itemCount: listController.liveQuizzes.length > 5 ? 5 : listController.liveQuizzes.length,
                        itemBuilder: (context, index) {
                          return QuizCard(isLive: true, lQuiz: listController.liveQuizzes.elementAt(index), isStudent: false,);
                        }
                    );
                  }
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
          ],
        ),
      ),
    );
  }
}
