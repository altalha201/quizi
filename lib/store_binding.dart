
import 'package:get/get.dart';

import 'ui/controllers/avater_controller.dart';

class StoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AvaterController());
  }
}