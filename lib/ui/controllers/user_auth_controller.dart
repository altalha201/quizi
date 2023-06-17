import 'dart:developer';

import 'package:get/get.dart';
import 'package:quizi/data/services/firebase_auth_helper.dart';
import 'package:quizi/ui/controllers/cache_controller.dart';

class UserAuthController extends GetxController {
  bool _creatingUser = false;

  bool get creatingUser => _creatingUser;

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
}
