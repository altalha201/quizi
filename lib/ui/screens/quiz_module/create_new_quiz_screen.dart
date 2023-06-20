import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../../data/models/quiz_model/live_quiz_model.dart';
import '../../../data/models/quiz_model/normal_quiz_model.dart';
import '../../../data/models/quiz_model/question.dart';
import '../../controllers/get_user_controller.dart';
import '../../controllers/quiz_module/create_quiz_controller.dart';
import '../../controllers/teacher_module/home_tab_controller.dart';
import '../../utility/colors.dart';
import '../../widgets/card_widgets/quiz_view_card.dart';
import '../../widgets/loading_widget.dart';
import '../teacher_module/teacher_dashboard_screen.dart';

class CreateNewQuizScreen extends StatefulWidget {
  const CreateNewQuizScreen(
      {Key? key,
      required this.creatorName,
      required this.title,
      required this.themeURL,
      this.startDate,
      this.endDate,
      required this.isLive,
      required this.creatorID})
      : super(key: key);

  final String creatorName, creatorID, title, themeURL;
  final String? startDate, endDate;
  final bool isLive;

  @override
  State<CreateNewQuizScreen> createState() => _CreateNewQuizScreenState();
}

class _CreateNewQuizScreenState extends State<CreateNewQuizScreen> {
  final TextEditingController _noOfQuesET = TextEditingController();
  final TextEditingController _qET = TextEditingController();
  final TextEditingController _op1ET = TextEditingController();
  final TextEditingController _op2ET = TextEditingController();
  final TextEditingController _op3ET = TextEditingController();
  final TextEditingController _op4ET = TextEditingController();
  final TextEditingController _ansET = TextEditingController();
  final GlobalKey<FormState> _quesCountKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _quesKey = GlobalKey<FormState>();

  bool _questionCountAvailable = false;

  int _qCount = 0, _currentPos = 1;
  final List<Question> _questions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child:
            GetBuilder<CreateQuizController>(builder: (createQuizController) {
          if (createQuizController.creatingQuiz) {
            return const LoadingWidget();
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
            child: Column(
              children: [
                QuizViewCard(themeUrl: widget.themeURL, title: widget.title, creatorName: widget.creatorName, isLive: widget.isLive),
                Visibility(
                  visible: widget.isLive,
                  child: Column(
                    children: [
                      const SizedBox(height: 16.0),
                      const Text(
                        "Time Range",
                        style: TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: TextEditingController(
                                text: widget.startDate ?? "",
                              ),
                              readOnly: true,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: TextEditingController(
                                text: widget.endDate ?? "",
                              ),
                              readOnly: true,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Form(
                        key: _quesCountKey,
                        child: TextFormField(
                          controller: _noOfQuesET,
                          keyboardType: TextInputType.number,
                          decoration:
                              const InputDecoration(hintText: "Question Count"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Required";
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                        child: ElevatedButton(
                      onPressed: () {
                        if (_quesCountKey.currentState!.validate() ||
                            !(_questionCountAvailable)) {
                          setState(() {
                            _questionCountAvailable = true;
                            _qCount = int.parse(_noOfQuesET.text);
                          });
                        }
                      },
                      child: const Text("Make Questions"),
                    ))
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Expanded(
                  child: Visibility(
                    visible: _questionCountAvailable,
                    child: SingleChildScrollView(
                      child: Form(
                        key: _quesKey,
                        child: Column(children: [
                          Row(
                            children: [
                              Text(
                                "Q: $_currentPos",
                                style: const TextStyle(
                                    fontSize: 24,
                                    color: colorPrimary,
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Expanded(
                                child: TextFormField(
                                  controller: _qET,
                                  decoration: const InputDecoration(
                                      hintText: "Question"),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "required";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      hintText: "Option 1"),
                                  controller: _op1ET,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "required";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Expanded(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      hintText: "Option 2"),
                                  controller: _op2ET,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "required";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      hintText: "Option 3"),
                                  controller: _op3ET,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "required";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Expanded(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                      hintText: "Option 4"),
                                  controller: _op4ET,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "required";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                hintText: "Correct Answer"),
                            controller: _ansET,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "required";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_quesKey.currentState!.validate()) {
                                  final ques = Question(
                                    ques: _qET.text,
                                    op1: _op1ET.text,
                                    op2: _op2ET.text,
                                    op3: _op3ET.text,
                                    op4: _op4ET.text,
                                    ans: _ansET.text,
                                  );
                                  _questions.add(ques);
                                  if (_currentPos != _qCount) {
                                    setState(() {
                                      _currentPos += 1;
                                    });
                                    clearQ();
                                  } else {
                                    int quizCount =
                                        Get.find<GetUserController>()
                                                .teacherProfile
                                                .noOfQuizzes! +
                                            1;
                                    if (widget.isLive) {
                                      LiveQuizModel quiz = LiveQuizModel(
                                          quizId: const Uuid().v1(),
                                          creatorId: widget.creatorID,
                                          creatorName: widget.creatorName,
                                          quizTitle: widget.title,
                                          quizTheme: widget.themeURL,
                                          totalQuestions: _qCount,
                                          startDate: widget.startDate,
                                          endDate: widget.endDate);
                                      createQuizController
                                          .createLiveQuiz(
                                              quiz, _questions, quizCount)
                                          .then((value) {
                                        Get.find<HomeTabController>()
                                            .setToHome();
                                        Get.offAll(
                                            const TeacherDashboardScreen());
                                      });
                                    } else {
                                      NormalQuizModel quiz = NormalQuizModel(
                                          quizId: const Uuid().v1(),
                                          creatorId: widget.creatorID,
                                          creatorName: widget.creatorName,
                                          quizTitle: widget.title,
                                          quizTheme: widget.themeURL,
                                          totalQuestions: _qCount);

                                      createQuizController
                                          .createNormalQuiz(
                                              quiz, _questions, quizCount)
                                          .then((value) {
                                        Get.find<HomeTabController>()
                                            .setToHome();

                                        Get.offAll(
                                            const TeacherDashboardScreen());
                                      });
                                    }
                                  }
                                }
                              },
                              child: Text(
                                  _currentPos == _qCount ? "Finish" : "Next"),
                            ),
                          ),
                        ]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }

  void clearQ() {
    _qET.text = "";
    _op1ET.text = "";
    _op2ET.text = "";
    _op3ET.text = "";
    _op4ET.text = "";
    _ansET.text = "";
  }
}

