import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizi/ui/screens/quiz_module/play_quiz_screen.dart';

import '../../../data/models/quiz_model/live_quiz_model.dart';
import '../../../data/models/quiz_model/normal_quiz_model.dart';
import '../../utility/colors.dart';
import '../../utility/other_utils.dart';
import '../../widgets/appbars/logo_appbar.dart';
import '../../widgets/card_widgets/quiz_view_card.dart';

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
              child: InkWell(
                onTap: () {
                  Get.to(PlayQuizScreen(quizID: isLive
                      ? (liveQuizModel?.quizId ?? "")
                      : (normalQuizModel?.quizId ?? "")));
                },
                borderRadius: const BorderRadius.all(Radius.circular(100)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    elevation: 5,
                    shadowColor: colorPrimary.withOpacity(0.3),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    color: colorPrimary,
                    child: const SizedBox(
                      height: 100,
                      width: 100,
                      child: Center(
                          child: Text(
                        "Start Quiz",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500),
                      )),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
