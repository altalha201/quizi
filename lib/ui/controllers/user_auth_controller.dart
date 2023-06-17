import 'dart:developer';

import 'package:get/get.dart';

import '../../data/services/firebase_auth_helper.dart';
import 'cache_controller.dart';

class UserAuthController extends GetxController {
  bool _creatingUser = false;
  bool _loginProgressing = false;

  bool get creatingUser => _creatingUser;
  bool get loginProgressing => _loginProgressing;

  Future<bool> createUser(String email, String pass) async {
    _creatingUser = true;
    update();

    final response = await FirebaseAuthHelper().createUser(email, pass);

    _creatingUser = false;

    if (response.isSuccess) {
      log(response.returnData);
      Get.find<CacheController>().saveUserID(response.returnData);
      update();
      return true;
    } else {
      if (response.returnData == 'week-password') {
        Get.showSnackbar(const GetSnackBar(
          title: "User Create Failed",
          message: "Password is week try use another password",
          duration: Duration(seconds: 3),
        ));
      } else if (response.returnData == 'email-already-in-use') {
        Get.showSnackbar(const GetSnackBar(
          title: "User Create Failed",
          message: "User already exist. try using another email",
          duration: Duration(seconds: 3),
        ));
      } else {
        Get.showSnackbar(const GetSnackBar(
          title: "User Create Failed",
          message: "Unexpected happened. try again later",
          duration: Duration(seconds: 3),
        ));
      }
      update();
      return false;
    }
  }

  Future<bool> loginUser(String email, String pass) async {
    _loginProgressing = true;
    update();

    final response = await FirebaseAuthHelper().loginUser(email, pass);
    _loginProgressing = false;
    if (response.isSuccess) {
      Get.find<CacheController>().saveUserID(response.returnData);
      update();
      return true;
    } else {
      if (response.returnData == 'user-not-found') {
        Get.showSnackbar(const GetSnackBar(
          title: "Login failed",
          message: "The user is not found.",
          duration: Duration(seconds: 3),
        ));
      } else if (response.returnData == 'wrong-password') {
        Get.showSnackbar(const GetSnackBar(
          title: "Login failed",
          message: "Wrong password. Try again.",
          duration: Duration(seconds: 3),
        ));
      } else {
        Get.showSnackbar(const GetSnackBar(
          title: "Login failed",
          message: "Unexpected happened. try again later",
          duration: Duration(seconds: 3),
        ));
      }
      update();
      return false;
    }
  }
}
