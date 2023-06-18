import 'package:get/get.dart';

import '../../data/services/firebase_storage_helper.dart';

class AvatarController extends GetxController {
  bool _gettingAvatar = false;
  List _avatars = [];

  bool get gettingAvatars => _gettingAvatar;
  List get avatars => _avatars;

  Future<void> getAvatars() async {
    _gettingAvatar = true;
    update();
    _avatars = await FirebaseStorageHelper().getDataFromStorage('avaters');

    _gettingAvatar = false;
    update();
  }
}