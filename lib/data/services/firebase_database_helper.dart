import 'dart:convert';
import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';

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

  Future<RequestModel> getTeacherProfile(String uid) async {
    final teacher = await database.ref("users/teachers/$uid").get();
    if (teacher.exists) {
      log(teacher.toString());
      return RequestModel(isSuccess: true, returnData: jsonEncode(teacher));
    } else {
      return RequestModel(isSuccess: false);
    }
  }
}