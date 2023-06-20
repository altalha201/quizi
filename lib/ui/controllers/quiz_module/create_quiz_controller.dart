import 'package:get/get.dart';

import '../../../data/models/quiz_model/live_quiz_model.dart';
import '../../../data/models/quiz_model/normal_quiz_model.dart';
import '../../../data/models/quiz_model/question.dart';
import '../../../data/models/quiz_model/quiz_question_model.dart';
import '../../../data/services/cloud_store_helper.dart';
import '../../../data/services/firebase_database_helper.dart';

class CreateQuizController extends GetxController {
  bool _creatingQuiz = false;

  bool get creatingQuiz => _creatingQuiz;

  Future<void> createNormalQuiz(NormalQuizModel quizModel,
      List<Question> questions, int quizCount) async {
    _creatingQuiz = true;
    update();
    await CloudStoreHelper().createNormalQuiz(
      quizModel: quizModel,
      questionsModel: QuizQuestionsModel(
        quizId: quizModel.quizId!,
        questions: questions,
      ),
    );
    await FirebaseDatabaseHelper()
        .updateQuizCount(quizModel.creatorId!, quizCount);
    _creatingQuiz = false;
    update();
  }

  Future<void> createLiveQuiz(
      LiveQuizModel quizModel, List<Question> questions, int quizCount) async {
    _creatingQuiz = true;
    update();
    await CloudStoreHelper().createLiveQuiz(
      quizModel: quizModel,
      questionsModel: QuizQuestionsModel(
        quizId: quizModel.quizId!,
        questions: questions,
      ),
    );
    await FirebaseDatabaseHelper()
        .updateQuizCount(quizModel.creatorId!, quizCount);
    _creatingQuiz = false;
    update();
  }
}
