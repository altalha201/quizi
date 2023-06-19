import 'package:get/get.dart';

import '../../../data/models/quiz_model/live_quiz_model.dart';
import '../../../data/models/quiz_model/normal_quiz_model.dart';
import '../../../data/services/cloud_store_helper.dart';

class GetQuizzesController extends GetxController {
  bool _gettingNormalQuizzes = false, _gettingLiveQuizzes = false;

  List<NormalQuizModel> _quizzes = [];
  List<LiveQuizModel> _liveQuizzes = [];

  List get quizzes => _quizzes;
  List get liveQuizzes => _liveQuizzes;

  bool get gettingNormalQuizzes => _gettingNormalQuizzes;
  bool get gettingLiveQuizzes => _gettingLiveQuizzes;

  Future<void> getQuizzes() async {
    _gettingNormalQuizzes = true;
    update();
    final response = await CloudStoreHelper().getNormalQuizzes();
    _gettingNormalQuizzes = false;
    if(response.isSuccess) {
      _quizzes = response.returnData;
    }
    update();
  }

  Future<void> getLiveQuizzes() async {
    _gettingLiveQuizzes = true;
    update();
    final response = await CloudStoreHelper().getLiveQuizzes();
    _gettingLiveQuizzes = false;
    if(response.isSuccess) {
      _liveQuizzes = response.returnData;
    }
    update();
  }

}