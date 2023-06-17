import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizi/ui/controllers/get_user_controller.dart';

class StudentDashboardScreen extends StatefulWidget {
  const StudentDashboardScreen({Key? key}) : super(key: key);

  @override
  State<StudentDashboardScreen> createState() => _StudentDashboardScreenState();
}

class _StudentDashboardScreenState extends State<StudentDashboardScreen> {

  @override
  void initState() {
    Get.find<GetUserController>().getStudent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student"),
        centerTitle: true,
      ),
      body: Center(
        child: GetBuilder<GetUserController>(
          builder: (controller) {
            return Text(controller.studentProfile.userName ?? "No Name");
          }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Get.find<GetUserController>().getStudent();
        },
      ),
    );
  }
}
