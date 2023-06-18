import 'package:get/get.dart';

class CreateQuizController extends GetxController {
  bool _creatingQuiz = false;

  bool get creatingQuiz => _creatingQuiz;

  Future<void> createNormalQuiz() async {
    _creatingQuiz = true;
    update();
  }
}