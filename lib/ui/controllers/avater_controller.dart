import 'package:get/get.dart';

import '../../data/services/firebase_storage_helper.dart';

class AvaterController extends GetxController {
  bool _gettingAvaters = false;
  List _avaters = [];

  bool get gettingAvaters => _gettingAvaters;
  List get avaters => _avaters;

  Future<void> getAvaters() async {
    _gettingAvaters = true;
    update();
    _avaters = await FirebaseStorageHelper().getDataFromStorage();

    _gettingAvaters = false;
    update();
  }
}