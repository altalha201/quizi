import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/quiz_model/live_quiz_model.dart';
import '../../../data/models/quiz_model/normal_quiz_model.dart';
import '../../utility/colors.dart';
import '../../screens/quiz_module/start_quiz_screen.dart';
import '../../utility/other_utils.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({
    Key? key,
    required this.isLive,
    this.isStudent,
    this.nQuiz,
    this.lQuiz,
  }) : super(key: key);

  final bool isLive;
  final bool? isStudent;
  final NormalQuizModel? nQuiz;
  final LiveQuizModel? lQuiz;

  @override
  Widget build(BuildContext context) {
    final img = isLive
        ? (lQuiz?.quizTheme ?? quizCoverImg)
        : (nQuiz?.quizTheme ?? quizCoverImg);
    return InkWell(
      onTap: () {
        if(isLive) {
          Get.to(StartQuizScreen(isLive: true, liveQuizModel: lQuiz, fromStudent: isStudent,));
        } else {
          Get.to(StartQuizScreen(isLive: false, normalQuizModel: nQuiz, fromStudent: isStudent,));
        }
      },
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 100,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  ),
                  image: DecorationImage(image: NetworkImage(img), fit: BoxFit.fill)
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isLive
                          ? (lQuiz?.quizTitle ?? "")
                          : (nQuiz?.quizTitle ?? ""),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: colorPrimaryBackground,
                      ),
                    ),
                    const SizedBox(
                      height: 4.0,
                    ),
                    Text(
                      "Author: ${isLive ? (lQuiz?.creatorName ?? "") : (nQuiz?.creatorName ?? "")}",
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                        "No. of Questions: ${isLive ? (lQuiz?.totalQuestions ?? 0) : (nQuiz?.totalQuestions ?? 0)}"),
                    Visibility(
                      visible: isLive,
                      child: const SizedBox(
                        height: 4.0,
                      ),
                    ),
                    Visibility(
                      visible: isLive,
                      child: Row(
                        children: const [
                          CircleAvatar(
                            radius: 2,
                            backgroundColor: Colors.redAccent,
                          ),
                          SizedBox(
                            width: 4.0,
                          ),
                          Text(
                            "Live",
                            style: TextStyle(color: Colors.redAccent),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.arrow_forward_ios_sharp,
                color: colorPrimary,
              ),
              const SizedBox(
                width: 16.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
