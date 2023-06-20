import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/quiz_module/save_quiz_data_controller.dart';
import '../../utility/colors.dart';
import '../../widgets/appbars/logo_appbar.dart';
import '../../widgets/circle_button.dart';
import '../../widgets/loading_widget.dart';
import '../student_module/student_dashboard_screen.dart';

class QuizResultScreen extends StatefulWidget {
  const QuizResultScreen({
    Key? key,
    required this.points,
    required this.quizID,
    required this.creatorID,
    required this.totalPoints,
  }) : super(key: key);

  final int points, totalPoints;
  final String quizID, creatorID;

  @override
  State<QuizResultScreen> createState() => _QuizResultScreenState();
}

class _QuizResultScreenState extends State<QuizResultScreen> {
  @override
  void initState() {
    Get.find<SaveQuizDataController>()
        .saveQuizData(widget.quizID, widget.creatorID, widget.points, widget.totalPoints);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: logoAppbar(),
      body: GetBuilder<SaveQuizDataController>(builder: (controller) {
        if (controller.savingData) {
          return const LoadingWidget();
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Your Score:",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 16.0,
                width: double.infinity,
              ),
              Ink(
                decoration: BoxDecoration(
                    border: Border.all(color: colorPrimary, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "${widget.points}",
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: colorPrimary),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
              ),
              CircleButton(
                label: "Ok",
                onTap: () {
                  Get.offAll(const StudentDashboardScreen());
                },
              )
            ],
          ),
        );
      }),
    );
  }
}
