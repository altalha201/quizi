import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/teacher_module/get_teachers_quiz_list_controller.dart';
import '../../../widgets/card_widgets/quiz_card.dart';
import '../../../widgets/loading_widget.dart';
import '../../../widgets/remark_title.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<GetTeachersQuizListController>().getNormalList();
      await Get.find<GetTeachersQuizListController>().getLiveQuizzes();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const RemarkTitle(
          label: "My Quizzes",
        ),
        GetBuilder<GetTeachersQuizListController>(
          builder: (controller) {
            if (controller.gettingNormalList) {
              return const LoadingWidget();
            }
            return SizedBox(
              height: 105,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.normalQuizzes.length,
                itemBuilder: (context, index) {
                  return QuizCard(isLive: false, nQuiz: controller.normalQuizzes[index],);
                },
              ),
            );
          },
        ),
        const SizedBox(height: 16.0,),
        const RemarkTitle(
          label: "My Live Quizzes",
        ),
        GetBuilder<GetTeachersQuizListController>(
          builder: (controller) {
            if (controller.gettingLiveList) {
              return const LoadingWidget();
            }
            return SizedBox(
              height: 105,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.liveQuizzes.length,
                itemBuilder: (context, index) {
                  return QuizCard(isLive: true, lQuiz: controller.liveQuizzes[index],);
                },
              ),
            );
          },
        )
      ],
    );
  }
}
