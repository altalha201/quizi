import 'package:flutter/material.dart';

import '../../../widgets/card_widgets/quiz_card.dart';
import '../../../widgets/remark_title.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const RemarkTitle(label: "My Quizzes",),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [for (var i = 0; i <= 9; i++) const QuizCard()],
            ),
          ),
        )
      ],
    );
  }
}
