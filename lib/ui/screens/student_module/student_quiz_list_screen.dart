import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/quiz_module/get_quizzes_controller.dart';
import '../../widgets/card_widgets/quiz_card.dart';
import '../../widgets/loading_widget.dart';

class StudentQuizListScreen extends StatefulWidget {
  const StudentQuizListScreen({
    Key? key,
    required this.title,
    this.isLive,
  }) : super(key: key);

  final String title;
  final bool? isLive;

  @override
  State<StudentQuizListScreen> createState() => _StudentQuizListScreenState();
}

class _StudentQuizListScreenState extends State<StudentQuizListScreen> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if(widget.isLive ?? false) {
        await Get.find<GetQuizzesController>().getLiveQuizzes();
      } else {
        await Get.find<GetQuizzesController>().getQuizzes();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<GetQuizzesController>(
          builder: (controller) {
            if (widget.isLive ?? false) {
              if (controller.gettingLiveQuizzes) {
                return const LoadingWidget();
              }
              return ListView.builder(
                itemCount: controller.liveQuizzes.length,
                  itemBuilder: (context, index) {
                  return QuizCard(isLive: true, lQuiz: controller.liveQuizzes.elementAt(index),);
                  }
              );
            } else {
              if (controller.gettingNormalQuizzes) {
                return const LoadingWidget();
              }
              return ListView.builder(
                  itemCount: controller.quizzes.length,
                  itemBuilder: (context, index) {
                    return QuizCard(isLive: false, nQuiz: controller.quizzes.elementAt(index),);
                  }
              );
            }
          },
        ),
      ),
    );
  }
}
