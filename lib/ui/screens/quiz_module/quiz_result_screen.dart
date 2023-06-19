import 'package:flutter/material.dart';

import '../../widgets/appbars/logo_appbar.dart';

class QuizResultScreen extends StatelessWidget {
  const QuizResultScreen(
      {Key? key,
      required this.points,
      required this.quizID,
      required this.creatorID,
      required this.answers})
      : super(key: key);

  final int points;
  final String quizID, creatorID;
  final List<String> answers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: logoAppbar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("$points"),
            Text(creatorID),
            Text(quizID),
          ],
        ),
      ),
    );
  }
}
