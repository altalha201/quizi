import 'package:get/get.dart';

import '../../../data/models/quiz_model/live_quiz_model.dart';
import '../../../data/models/quiz_model/normal_quiz_model.dart';
import '../../../data/services/cloud_store_helper.dart';
import '../cache_controller.dart';

class GetTeachersQuizListController extends GetxController {
  bool _gettingNormalList = false, _gettingLiveList = false;

  List<NormalQuizModel> _normalQuizzes = [];
  List<LiveQuizModel> _liveQuizzes = [];

  bool get gettingNormalList => _gettingNormalList;
  bool get gettingLiveList => _gettingLiveList;

  List get normalQuizzes => _normalQuizzes;
  List get liveQuizzes => _liveQuizzes;

  Future<void> getNormalList() async {
    _gettingNormalList = true;
    update();
    final response = await CloudStoreHelper().getNormalQuizListBYTID(Get.find<CacheController>().userId!);
    if(response.isSuccess) {
      _normalQuizzes = response.returnData;
    }
    _gettingNormalList = false;
    update();
  }

  Future<void> getLiveQuizzes() async {
    _gettingLiveList = true;
    update();
    final response = await CloudStoreHelper().getLiveQuizListByTID(Get.find<CacheController>().userId!);
    if(response.isSuccess) {
      _liveQuizzes = response.returnData;
    }
    _gettingLiveList = false;
    update();
  }
}