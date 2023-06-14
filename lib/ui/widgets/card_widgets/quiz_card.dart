import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utility/other_utils.dart';
import '../../utility/colors.dart';
import '../../screens/quiz_module/start_quiz_screen.dart';

class QuizCard extends StatelessWidget {
  const QuizCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(const StartQuizScreen());
      },
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(10),),),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    quizCoverImg,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8.0,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Quiz Title",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: colorPrimaryBackground,
                    ),
                  ),
                  SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    "Author: Mr. Aziz Alam",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  Text("No. of Questions: 10")
                ],
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_sharp, color: colorPrimary,),
            const SizedBox(width: 16.0,),
          ],
        ),
      ),
    );
  }
}
