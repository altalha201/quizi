import 'package:get/get.dart';
import 'package:quizi/data/models/quiz_model/normal_quiz_model.dart';

import '../../../data/models/quiz_model/question.dart';

class CreateQuizController extends GetxController {
  bool _creatingQuiz = false;

  bool get creatingQuiz => _creatingQuiz;

  Future<void> createNormalQuiz(NormalQuizModel quizModel, List<Question> questions) async {
    _creatingQuiz = true;
    update();
  }
}