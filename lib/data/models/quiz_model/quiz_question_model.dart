import 'question.dart';

class QuizQuestionsModel {
  String? quizId;
  List<Question>? questions;

  QuizQuestionsModel({this.quizId, this.questions});

  QuizQuestionsModel.fromJson(Map<String, dynamic> json) {
    quizId = json['quiz_id'];
    if (json['questions'] != null) {
      questions = <Question>[];
      json['questions'].forEach((v) {
        questions!.add(Question.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['quiz_id'] = quizId;
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
