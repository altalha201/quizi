import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:quizi/ui/screens/home_screen.dart';

class CacheController extends GetxController {
  String? _userId;

  String? get userId => _userId;

  bool isLogin () {
    getUserID();
    return _userId != null;
  }

  void saveUserID(uID) {
    _userId = uID;
    GetStorage().write('quizi_uid', uID);
  }

  void getUserID() {
    _userId = GetStorage().read('quizi_uid');
  }

  void logout() {
    clearData();
    _userId == null;
    Get.offAll(const HomeScreen());
  }

  void clearData() {
    GetStorage().erase();
  }
}