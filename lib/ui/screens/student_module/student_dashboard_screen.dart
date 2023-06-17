import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/get_user_controller.dart';
import '../../widgets/appbars/logo_appbar.dart';
import '../../widgets/card_widgets/quiz_card.dart';
import '../../widgets/card_widgets/student_profile_card.dart';
import '../../widgets/loading_widget.dart';
import '../../widgets/remark_title.dart';

class StudentDashboardScreen extends StatefulWidget {
  const StudentDashboardScreen({Key? key}) : super(key: key);

  @override
  State<StudentDashboardScreen> createState() => _StudentDashboardScreenState();
}

class _StudentDashboardScreenState extends State<StudentDashboardScreen> {
  @override
  void initState() {
    super.initState();
    if (Get.find<GetUserController>().studentProfile.uid == null) {
      Get.find<GetUserController>().getStudent();
    }
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
              child:
                  GetBuilder<GetUserController>(builder: (profileController) {
                if (profileController.gettingProfile) {
                  return const LoadingWidget();
                }
                return StudentProfileCard(
                  student: profileController.studentProfile,
                );
              }),
            ),
            const SizedBox(
              height: 32.0,
            ),
            RemarkTitle(label: "Available Quizzes", onSeeAllTap: () {}),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    for (var i = 0; i <= 8; i++) const QuizCard()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
