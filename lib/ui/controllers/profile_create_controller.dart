import 'package:get/get.dart';

import '../../data/models/student_profile_model.dart';
import '../../data/models/teacher_profile_model.dart';
import '../../data/services/firebase_database_helper.dart';
import 'cache_controller.dart';

class ProfileCreateController extends GetxController {
  bool _creatingProfile = false;

  bool get creatingProfile =>_creatingProfile;

  Future<bool> createStudent(String name, String email, String imgUrl) async {
    _creatingProfile = true;
    update();
    final student = StudentProfileModel(
      uid: Get.find<CacheController>().userId,
      userName: name,
      email: email,
      imgUrl: imgUrl,
      role: 'student',
      totalPoints: 0,
      points: 0
    );
    await FirebaseDatabaseHelper().saveUserRole(student.uid!, student.role!);
    await FirebaseDatabaseHelper().createStudentProfile(student);
    _creatingProfile = false;
    update();
    return true;
  }

  Future<bool> createTeacher(String name, String email, String imgUrl) async {
    _creatingProfile = true;
    update();
    final teacher = TeacherProfileModel(
        uid: Get.find<CacheController>().userId,
        userName: name,
        email: email,
        imgUrl: imgUrl,
        role: 'teacher',
        noOfQuizzes: 0,
        participants: 0
    );
    await FirebaseDatabaseHelper().saveUserRole(teacher.uid!, teacher.role!);
    await FirebaseDatabaseHelper().createTeacherProfile(teacher);
    _creatingProfile = false;
    update();
    return true;
  }
}