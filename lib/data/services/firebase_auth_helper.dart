import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../models/request_model.dart';

class FirebaseAuthHelper {
  final authRef = FirebaseAuth.instance;

  Future<RequestModel> createUser(String email, String pass) async {
    try {
      final credential = await authRef.createUserWithEmailAndPassword(
          email: email, password: pass);
      return RequestModel(isSuccess: true, returnData: credential.user!.uid);
    } on FirebaseAuthException catch(e) {
      return RequestModel(isSuccess: false, returnData: e.code);
    } catch (e) {
      log(e.toString());
      return RequestModel(isSuccess: false);
    }
  }

  Future<RequestModel> loginUser(String email, String pass) async {
    try {
      final credential = await authRef.signInWithEmailAndPassword(email: email, password: pass);
      return RequestModel(isSuccess: true, returnData: credential.user!.uid);
    } on FirebaseAuthException catch(e) {
      return RequestModel(isSuccess: false, returnData: e.code);
    } catch (e) {
      log(e.toString());
      return RequestModel(isSuccess: false);
    }
  }
}
