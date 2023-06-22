import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/get_user_controller.dart';
import '../../controllers/quiz_module/get_quizzes_controller.dart';
import '../../widgets/appbars/logo_appbar.dart';
import '../../widgets/card_widgets/quiz_card.dart';
import '../../widgets/card_widgets/student_profile_card.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/remark_title.dart';
import 'student_quiz_list_screen.dart';

class StudentDashboardScreen extends StatefulWidget {
  const StudentDashboardScreen({Key? key}) : super(key: key);

  @override
  State<StudentDashboardScreen> createState() => _StudentDashboardScreenState();
}

class _StudentDashboardScreenState extends State<StudentDashboardScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Get.find<GetUserController>().getStudent();
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
            SizedBox(
              height: 200,
              child: GetBuilder<GetUserController>(
                builder: (profileController) {
                  if (profileController.gettingProfile) {
                    return const LoadingWidget();
                  }
                  return StudentProfileCard(
                    student: profileController.studentProfile,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            RemarkTitle(
              label: "Available Quizzes",
              onSeeAllTap: () {
                Get.to(const StudentQuizListScreen(
                  title: "Available Quizzes",
                  isLive: false,
                ));
              },
            ),
            Expanded(
              child:
                  GetBuilder<GetQuizzesController>(builder: (listController) {
                if (listController.gettingNormalQuizzes) {
                  return const LoadingWidget();
                }
                return ListView.builder(
                    itemCount: listController.quizzes.length > 5
                        ? 5
                        : listController.quizzes.length,
                    itemBuilder: (context, index) {
                      return QuizCard(
                        isLive: false,
                        nQuiz: listController.quizzes.elementAt(index),
                        isStudent: true,
                      );
                    });
              }),
            ),
            const SizedBox(
              height: 16.0,
            ),
            RemarkTitle(
              label: "Available Live Quizzes",
              onSeeAllTap: () {
                Get.to(const StudentQuizListScreen(
                  title: "Available Live Quizzes",
                  isLive: true,
                ));
              },
            ),
            Expanded(
              child:
                  GetBuilder<GetQuizzesController>(builder: (listController) {
                if (listController.gettingLiveQuizzes) {
                  return const LoadingWidget();
                }
                return ListView.builder(
                    itemCount: listController.liveQuizzes.length > 5
                        ? 5
                        : listController.liveQuizzes.length,
                    itemBuilder: (context, index) {
                      return QuizCard(
                        isLive: true,
                        lQuiz: listController.liveQuizzes.elementAt(index),
                        isStudent: true,
                      );
                    });
              }),
            ),
          ],
        ),
      ),
    );
  }
}
