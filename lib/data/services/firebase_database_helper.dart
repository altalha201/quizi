import 'dart:convert';
import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:quizi/data/models/quiz_model/live_quiz_model.dart';
import 'package:quizi/data/models/quiz_model/normal_quiz_model.dart';
import 'package:quizi/data/models/quiz_model/quiz_question_model.dart';

import '../models/request_model.dart';
import '../models/student_profile_model.dart';
import '../models/teacher_profile_model.dart';

class FirebaseDatabaseHelper {
  final database = FirebaseDatabase.instance;

  Future<void> createStudentProfile(StudentProfileModel profileModel) async {
    final ref = database.ref("users/students/${profileModel.uid}");
    await ref.set(profileModel.toJson());
  }

  Future<void> createTeacherProfile(TeacherProfileModel profileModel) async {
    final ref = database.ref("users/teachers/${profileModel.uid}");
    await ref.set(profileModel.toJson());
  }

  Future<void> saveUserRole(String uid, String role) async {
    final ref = database.ref("user/$uid");
    await ref.set({
      "uid" : uid,
      "role" : role,
    });
  }

  Future<String> getUserRole(String uid) async {
    final role = await database.ref("user/$uid/role").get();
    if (role.exists) {
      log(role.value.toString());
      return role.value.toString();
    } else {
      return "";
    }
  }

  Future<RequestModel> getStudentProfile(String uid) async {
    final student = await database.ref("users/students/$uid").get();
    if (student.exists) {

      log(student.value.toString());
      return RequestModel(isSuccess: true, returnData: jsonEncode(student.value));
    } else {
      return RequestModel(isSuccess: false);
    }
  }

  Future<void> createNormalQuiz(NormalQuizModel quizModel) async {
    final quizRef = database.ref("quizzes/normal/${quizModel.quizId}");
    await quizRef.set(quizModel.toJson());
  }

  // Future<RequestModel> getNormalQuizes() async {
  //
  // }

  Future<void> createLiveQuiz(LiveQuizModel quizModel) async {
    final quizRef = database.ref("quizzes/live/${quizModel.quizId}");
    await quizRef.set(quizModel.toJson());
  }

  Future<void> saveQuestions(QuizQuestionsModel ques) async {
    final ref = database.ref("quizzes/questions/${ques.quizId}");
    await ref.set(ques.toJson());
  }

  Future<void> saveToProfile(String creatorID, String quizID, String type) async {
    final ref = database.ref("quizzes/teacher/$creatorID/$quizID");
    ref.set({
      "quiz_id" : quizID,
      "type" : type
    });
  }

  Future<void> updateQuizCount(String teacherID, int newValue) async {
    final ref = database.ref("users/teachers/$teacherID");
    await ref.update({'no_of_quizzes' : newValue});
  }

  Future<RequestModel> getTeacherProfile(String uid) async {
    final teacher = await database.ref("users/teachers/$uid").get();
    if (teacher.exists) {
      log(teacher.value.toString());
      return RequestModel(isSuccess: true, returnData: jsonEncode(teacher.value));
    } else {
      return RequestModel(isSuccess: false);
    }
  }
}