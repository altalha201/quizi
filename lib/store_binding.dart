
import 'package:get/get.dart';

import 'ui/controllers/avatar_controller.dart';
import 'ui/controllers/cache_controller.dart';
import 'ui/controllers/get_user_controller.dart';
import 'ui/controllers/profile_create_controller.dart';
import 'ui/controllers/quiz_theme_controller.dart';
import 'ui/controllers/teacher_module/home_tab_controller.dart';
import 'ui/controllers/user_auth_controller.dart';

class StoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AvatarController());
    Get.put(CacheController());
    Get.put(GetUserController());
    Get.put(HomeTabController());
    Get.put(ProfileCreateController());
    Get.put(QuizThemeController());
    Get.put(UserAuthController());
  }
}