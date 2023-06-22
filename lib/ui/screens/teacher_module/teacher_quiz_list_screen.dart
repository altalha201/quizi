import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/teacher_module/get_teachers_quiz_list_controller.dart';
import '../../widgets/card_widgets/quiz_card.dart';
import '../../widgets/loading_widget.dart';

class TeacherQuizListScreen extends StatefulWidget {
  const TeacherQuizListScreen({Key? key, required this.title, this.isLive}) : super(key: key);

  final String title;
  final bool? isLive;

  @override
  State<TeacherQuizListScreen> createState() => _TeacherQuizListScreenState();
}

class _TeacherQuizListScreenState extends State<TeacherQuizListScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if(widget.isLive ?? false) {
        await Get.find<GetTeachersQuizListController>().getLiveQuizzes();
      } else {
        await Get.find<GetTeachersQuizListController>().getNormalList();
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
        child: GetBuilder<GetTeachersQuizListController>(
          builder: (controller) {
            if (widget.isLive ?? false) {
              if (controller.gettingLiveList) {
                return const LoadingWidget();
              }
              return ListView.builder(
                  itemCount: controller.liveQuizzes.length,
                  itemBuilder: (context, index) {
                    return QuizCard(isLive: true, lQuiz: controller.liveQuizzes.elementAt(index),);
                  }
              );
            } else {
              if (controller.gettingNormalList) {
                return const LoadingWidget();
              }
              return ListView.builder(
                  itemCount: controller.normalQuizzes.length,
                  itemBuilder: (context, index) {
                    return QuizCard(isLive: false, nQuiz: controller.normalQuizzes.elementAt(index),);
                  }
              );
            }
          },
        ),
      ),
    );
  }
}
