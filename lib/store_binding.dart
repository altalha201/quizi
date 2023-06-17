
import 'package:get/get.dart';

import 'ui/controllers/avatar_controller.dart';
import 'ui/controllers/cache_controller.dart';
import 'ui/controllers/get_user_controller.dart';
import 'ui/controllers/profile_create_controller.dart';
import 'ui/controllers/user_auth_controller.dart';

class StoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AvatarController());
    Get.put(CacheController());
    Get.put(GetUserController());
    Get.put(ProfileCreateController());
    Get.put(UserAuthController());
  }
}