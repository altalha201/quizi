import 'package:get/get.dart';
import 'package:quizi/data/models/quiz_model/live_quiz_model.dart';
import 'package:quizi/data/models/quiz_model/normal_quiz_model.dart';
import 'package:quizi/data/models/quiz_model/quiz_question_model.dart';
import 'package:quizi/data/services/firebase_database_helper.dart';

import '../../../data/models/quiz_model/question.dart';

class CreateQuizController extends GetxController {
  bool _creatingQuiz = false;

  bool get creatingQuiz => _creatingQuiz;

  Future<void> createNormalQuiz(NormalQuizModel quizModel, List<Question> questions, int quizCount) async {
    _creatingQuiz = true;
    update();
    await FirebaseDatabaseHelper().createNormalQuiz(quizModel);
    await _commonCaller(quizModel.quizId!, quizModel.creatorId!, "normal", questions, quizCount);
     _creatingQuiz = false;
     update();
  }

  Future<void> createLiveQuiz(LiveQuizModel quizModel, List<Question> questions, int quizCount) async {
    _creatingQuiz = true;
    update();
    await FirebaseDatabaseHelper().createLiveQuiz(quizModel);
    await _commonCaller(quizModel.quizId!, quizModel.creatorId!, "live", questions, quizCount);
    _creatingQuiz = false;
    update();
  }

  Future<void> _commonCaller(String quizId, String creatorID,String type, List<Question> questions, int quizCount) async {
    await FirebaseDatabaseHelper().saveQuestions(QuizQuestionsModel(quizId: quizId, questions: questions));
    await FirebaseDatabaseHelper().saveToProfile(creatorID, quizId, "normal");
    await FirebaseDatabaseHelper().updateQuizCount(creatorID, quizCount);
  }
}