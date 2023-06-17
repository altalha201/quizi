import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_create_response_model.dart';

class FirebaseAuthHelper {
  final authRef = FirebaseAuth.instance;

  Future<UserCreateResponseModel> createUser(String email, String pass) async {
    try {
      final credential = await authRef.createUserWithEmailAndPassword(
          email: email, password: pass);
      return UserCreateResponseModel(isSuccess: true, returnData: credential.user!.uid);
    } on FirebaseAuthException catch(e) {
      return UserCreateResponseModel(isSuccess: false, returnData: e.code);
    } catch (e) {
      log(e.toString());
      return UserCreateResponseModel(isSuccess: false, returnData: "");
    }
  }
}
