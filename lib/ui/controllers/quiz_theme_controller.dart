import 'package:get/get.dart';

import '../../data/services/firebase_storage_helper.dart';

class QuizThemeController extends GetxController {
  bool _gettingThemes = false;
  List _themes = [];

  bool get gettingThemes => _gettingThemes;
  List get themes => _themes;

  Future<void> getThemes() async {
    _gettingThemes = true;
    update();
    _themes = await FirebaseStorageHelper().getDataFromStorage('quiz_cover');

    _gettingThemes = false;
    update();
  }
}