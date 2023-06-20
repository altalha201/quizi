import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/quiz_module/play_controller.dart';
import '../../utility/colors.dart';
import '../../widgets/appbars/logo_appbar.dart';
import '../../widgets/loading_widget.dart';
import 'quiz_result_screen.dart';

class PlayQuizScreen extends StatefulWidget {
  const PlayQuizScreen(
      {Key? key,
      required this.quizID,
      required this.creatorID,
      required this.totalPoints})
      : super(key: key);

  final String quizID, creatorID;
  final int totalPoints;

  @override
  State<PlayQuizScreen> createState() => _PlayQuizScreenState();
}

class _PlayQuizScreenState extends State<PlayQuizScreen> {
  String _selectedAnswer = "";
  int _points = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<PlayController>().getQuestions(widget.quizID);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: logoAppbar(),
      body: GetBuilder<PlayController>(builder: (playController) {
        if (playController.gettingQuestions) {
          return const LoadingWidget();
        }
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Question ${playController.currentPosition + 1}",
                style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    color: colorPrimary),
              ),
              const SizedBox(
                height: 32.0,
              ),
              Text(
                playController.questions[playController.currentPosition].ques ??
                    "",
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: colorPrimaryBackground),
              ),
              const SizedBox(
                height: 16.0,
              ),
              RadioListTile(
                value: playController.questions
                    .elementAt(playController.currentPosition)
                    .op1,
                title: Text(playController.questions
                        .elementAt(playController.currentPosition)
                        .op1 ??
                    ""),
                groupValue: _selectedAnswer,
                onChanged: (value) {
                  setState(() {
                    _selectedAnswer = value!;
                  });
                },
              ),
              const SizedBox(
                height: 8.0,
              ),
              RadioListTile(
                value: playController.questions
                    .elementAt(playController.currentPosition)
                    .op2,
                title: Text(playController.questions
                        .elementAt(playController.currentPosition)
                        .op2 ??
                    ""),
                groupValue: _selectedAnswer,
                onChanged: (value) {
                  setState(() {
                    _selectedAnswer = value!;
                  });
                },
              ),
              const SizedBox(
                height: 8.0,
              ),
              RadioListTile(
                value: playController.questions
                    .elementAt(playController.currentPosition)
                    .op3,
                title: Text(playController.questions
                        .elementAt(playController.currentPosition)
                        .op3 ??
                    ""),
                groupValue: _selectedAnswer,
                onChanged: (value) {
                  setState(() {
                    _selectedAnswer = value!;
                  });
                },
              ),
              const SizedBox(
                height: 8.0,
              ),
              RadioListTile(
                value: playController.questions
                    .elementAt(playController.currentPosition)
                    .op4,
                title: Text(playController.questions
                        .elementAt(playController.currentPosition)
                        .op4 ??
                    ""),
                groupValue: _selectedAnswer,
                onChanged: (value) {
                  setState(() {
                    _selectedAnswer = value!;
                  });
                },
              ),
              const SizedBox(
                height: 32.0,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_selectedAnswer ==
                        playController.questions
                            .elementAt(playController.currentPosition)
                            .ans) {
                      _points++;
                    }
                    _selectedAnswer = "";
                    if ((playController.currentPosition + 1) ==
                        playController.questions.length) {
                      Get.off(QuizResultScreen(
                        points: _points,
                        quizID: widget.quizID,
                        creatorID: widget.creatorID,
                        totalPoints: widget.totalPoints,
                      ));
                    } else {
                      playController.updateQuestion();
                    }
                  },
                  child: Text((playController.currentPosition + 1) ==
                          playController.questions.length
                      ? "Finish"
                      : "Next"),
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
