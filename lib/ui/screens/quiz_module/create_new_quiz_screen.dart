import 'package:flutter/material.dart';
import 'package:quizi/ui/utility/colors.dart';
import 'package:quizi/ui/widgets/card_widgets/theme_card.dart';

import '../../../data/models/quiz_model/question.dart';

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

  int _qCount = 0, _currentPos = 0;
  List<Question> _questions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
          child: Column(
            children: [
              Ink(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: colorPrimary, width: 2),
                ),
                child: Row(
                  children: [
                    ThemeCard(imgURL: widget.themeURL),
                    const SizedBox(width: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          widget.creatorName,
                          style: const TextStyle(
                              fontSize: 12, color: Colors.black54),
                        ),
                        Visibility(
                            visible: widget.isLive,
                            child: const SizedBox(height: 16)),
                        Visibility(
                            visible: widget.isLive,
                            child: Text("Live Quiz",
                                style: TextStyle(color: Colors.red.shade600))),
                      ],
                    )
                  ],
                ),
              ),
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
                              "Q: ${_currentPos + 1}",
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
                                decoration:
                                    const InputDecoration(hintText: "Question"),
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
                                decoration:
                                    const InputDecoration(hintText: "Option 1"),
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
                                decoration:
                                    const InputDecoration(hintText: "Option 2"),
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
                                decoration:
                                    const InputDecoration(hintText: "Option 3"),
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
                                decoration:
                                    const InputDecoration(hintText: "Option 4"),
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
                          decoration:
                              const InputDecoration(hintText: "Correct Answer"),
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
                            onPressed: () {},
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
        ),
      ),
    );
  }
}
