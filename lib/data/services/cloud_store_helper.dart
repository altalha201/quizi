import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/quiz_model/live_quiz_model.dart';
import '../models/quiz_model/normal_quiz_model.dart';
import '../models/quiz_model/question.dart';
import '../models/quiz_model/quiz_question_model.dart';
import '../models/request_model.dart';

class CloudStoreHelper {
  final cloud = FirebaseFirestore.instance;

  Future<void> createNormalQuiz({
    required NormalQuizModel quizModel,
    required QuizQuestionsModel questionsModel,
  }) async {
    await cloud
        .collection("normal_quizzes")
        .doc(quizModel.quizId)
        .set(quizModel.toJson());
    await cloud
        .collection("teachers_list")
        .doc(quizModel.creatorId)
        .collection("normal")
        .doc(quizModel.quizId)
        .set(quizModel.toJson());
    await cloud
        .collection("questions")
        .doc(questionsModel.quizId)
        .set(questionsModel.toJson());
  }

  Future<void> createLiveQuiz({
    required LiveQuizModel quizModel,
    required QuizQuestionsModel questionsModel,
  }) async {
    await cloud
        .collection("live_quizzes")
        .doc(quizModel.quizId)
        .set(quizModel.toJson());
    await cloud
        .collection("teachers_list")
        .doc(quizModel.creatorId)
        .collection("live")
        .doc(quizModel.quizId)
        .set(quizModel.toJson());
    await cloud
        .collection("questions")
        .doc(questionsModel.quizId)
        .set(questionsModel.toJson());
  }

  Future<RequestModel> getNormalQuizListBYTID(String tID) async {
    final ref = cloud.collection("teachers_list")
        .doc(tID).collection("normal");
    List<NormalQuizModel> returnList = [];
    await ref.get().then((documents) {
      for (var doc in documents.docs) {
        returnList.add(NormalQuizModel.fromJson(doc.data()));
        log(doc.data().toString());
      }
    });
    log(returnList.toString());
    return RequestModel(isSuccess: true, returnData: returnList);
  }

  Future<RequestModel> getNormalQuizzes() async {
    final ref = cloud.collection("normal_quizzes");
    List<NormalQuizModel> returnList = [];
    await ref.get().then((documents) {
      for (var doc in documents.docs) {
        returnList.add(NormalQuizModel.fromJson(doc.data()));
        log(doc.data().toString());
      }
    });
    log(returnList.toString());
    return RequestModel(isSuccess: true, returnData: returnList);
  }

  Future<RequestModel> getLiveQuizzes() async {
    final ref = cloud.collection("live_quizzes");
    List<LiveQuizModel> returnList = [];
    await ref.get().then((documents) {
      for (var doc in documents.docs) {
        returnList.add(LiveQuizModel.fromJson(doc.data()));
        log(doc.data().toString());
      }
    });
    log(returnList.toString());
    return RequestModel(isSuccess: true, returnData: returnList);
  }

  Future<RequestModel> getLiveQuizListByTID(String tID) async {
    final ref = cloud.collection("teachers_list")
        .doc(tID).collection("live");
    List<LiveQuizModel> returnList = [];
    await ref.get().then((documents) {
      for (var doc in documents.docs) {
        returnList.add(LiveQuizModel.fromJson(doc.data()));
        log(doc.data().toString());
      }
    });
    log(returnList.toString());
    return RequestModel(isSuccess: true, returnData: returnList);
  }

  Future<RequestModel> getQuestions(String quizID) async {
    final ref = cloud.collection("questions").doc(quizID);
    List<Question> returnList = [];
    await ref.get().then((documents) {
      QuizQuestionsModel model = QuizQuestionsModel.fromJson(documents.data()!);
      returnList = model.questions!;
    });
    log(returnList.toString());
    return RequestModel(isSuccess: true, returnData: returnList);
  }
}
