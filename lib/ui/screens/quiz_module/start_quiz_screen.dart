import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/quiz_model/live_quiz_model.dart';
import '../../../data/models/quiz_model/normal_quiz_model.dart';
import '../../utility/other_utils.dart';
import '../../widgets/appbars/logo_appbar.dart';
import '../../widgets/card_widgets/quiz_view_card.dart';
import '../../widgets/circle_button.dart';
import 'play_quiz_screen.dart';

class StartQuizScreen extends StatelessWidget {
  const StartQuizScreen(
      {Key? key,
      required this.isLive,
      this.fromStudent,
      this.normalQuizModel,
      this.liveQuizModel})
      : super(key: key);

  final bool isLive;
  final bool? fromStudent;
  final NormalQuizModel? normalQuizModel;
  final LiveQuizModel? liveQuizModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: logoAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            QuizViewCard(
              themeUrl: isLive
                  ? (liveQuizModel?.quizTheme ?? quizCoverImg)
                  : (normalQuizModel?.quizTheme ?? quizCoverImg),
              title: isLive
                  ? (liveQuizModel?.quizTitle ?? "")
                  : (normalQuizModel?.quizTitle ?? ""),
              creatorName: isLive
                  ? (liveQuizModel?.creatorName ?? "")
                  : (normalQuizModel?.creatorName ?? ""),
              isLive: isLive,
              fromDetails: true,
              points: isLive
                  ? (liveQuizModel?.totalQuestions ?? 0)
                  : (normalQuizModel?.totalQuestions ?? 0),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            Visibility(
              visible: fromStudent ?? false,
              child: CircleButton(label: 'Start Quiz', onTap: () {
                Get.to(
                  PlayQuizScreen(
                    quizID: isLive
                        ? (liveQuizModel?.quizId ?? "")
                        : (normalQuizModel?.quizId ?? ""),
                    creatorID: isLive
                        ? (liveQuizModel?.creatorId ?? "")
                        : (normalQuizModel?.creatorId ?? ""),
                    totalPoints: isLive
                        ? (liveQuizModel?.totalQuestions ?? 0)
                        : (normalQuizModel?.totalQuestions ?? 0),
                  ),
                );
              },),
            ),
          ],
        ),
      ),
    );
  }
}
