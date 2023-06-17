import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizi/ui/controllers/get_user_controller.dart';

class TeacherDashboardScreen extends StatefulWidget {
  const TeacherDashboardScreen({Key? key}) : super(key: key);

  @override
  State<TeacherDashboardScreen> createState() => _TeacherDashboardScreenState();
}

class _TeacherDashboardScreenState extends State<TeacherDashboardScreen> {

  @override
  void initState() {
    Get.find<GetUserController>().getTeacher();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teacher"),
        centerTitle: true,
      ),
    );
  }
}
