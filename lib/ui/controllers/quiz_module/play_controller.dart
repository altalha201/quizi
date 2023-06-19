import 'package:get/get.dart';

import '../../../data/models/quiz_model/question.dart';
import '../../../data/services/cloud_store_helper.dart';

class PlayController extends GetxController {
  bool _gettingQuestions = false;
  List<Question> _questions = [];
  int _currentQuestion = 0;

  bool get gettingQuestions =>_gettingQuestions;
  List<Question> get questions => _questions;
  int get currentPosition => _currentQuestion;

  Future<void> getQuestions(String quizID) async {
    _gettingQuestions = true;
    update();
    final response = await CloudStoreHelper().getQuestions(quizID);
    if (response.isSuccess) {
      _questions = response.returnData;
    }
    _currentQuestion = 0;
    _gettingQuestions = false;
    update();
  }

  void updateQuestion() {
    _currentQuestion ++;
    update();
  }
}