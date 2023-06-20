import 'package:get/get.dart';

import '../../../data/services/firebase_database_helper.dart';
import '../cache_controller.dart';

class SaveQuizDataController extends GetxController {
  bool _savingData = false;

  bool get savingData => _savingData;

  Future<void> saveQuizData(String quizID, String creatorID, int points, int totalPoints) async {
    _savingData = true;
    update();
    await FirebaseDatabaseHelper().updateParticipantsCount(creatorID);
    await FirebaseDatabaseHelper().updatePoints(Get.find<CacheController>().userId!, points, totalPoints);
    _savingData = false;
    update();

  }
}