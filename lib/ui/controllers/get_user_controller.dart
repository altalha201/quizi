import 'package:get/get.dart';

import '../../data/models/student_profile_model.dart';
import '../../data/models/teacher_profile_model.dart';
import '../../data/services/firebase_database_helper.dart';
import 'cache_controller.dart';

class GetUserController extends GetxController {
  bool _gettingProfile = false;

  StudentProfileModel _studentProfile = StudentProfileModel();
  TeacherProfileModel _teacherProfile = TeacherProfileModel();

  bool get gettingProfile => _gettingProfile;

  StudentProfileModel get studentProfile => _studentProfile;
  TeacherProfileModel get teacherProfile => _teacherProfile;

  Future<String> getUser() async {
    final role = await FirebaseDatabaseHelper().getUserRole(Get.find<CacheController>().userId!);
    return role;
  }

  Future<bool> getStudent() async {
    _gettingProfile = true;
    update();
    final response = await FirebaseDatabaseHelper().getStudentProfile(Get.find<CacheController>().userId!);
    _gettingProfile = false;
    if (response.isSuccess) {
      _studentProfile = StudentProfileModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }

  Future<bool> getTeacher() async {
    _gettingProfile = true;
    update();
    final response = await FirebaseDatabaseHelper().getTeacherProfile(Get.find<CacheController>().userId!);
    _gettingProfile = false;
    if (response.isSuccess) {
      _teacherProfile = TeacherProfileModel.fromJson(response.returnData);
      update();
      return true;
    } else {
      update();
      return false;
    }
  }
}