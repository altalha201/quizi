import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/avatar_controller.dart';
import '../../controllers/profile_create_controller.dart';
import '../../utility/colors.dart';
import '../../widgets/card_widgets/avatar_card.dart';
import '../../widgets/loading_widget.dart';
import '../student_module/student_dashboard_screen.dart';
import '../teacher_module/teacher_dashboard_screen.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({Key? key, required this.email}) : super(key: key);

  final String email;

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  int? _role = 0;
  int? _selectedAvatar = 0;

  final TextEditingController _nameET = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<AvatarController>().getAvatars();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Your Profile"),
        centerTitle: true,
      ),
      body: GetBuilder<AvatarController>(
        builder: (controller) {
          if (controller.gettingAvatars) {
            return const LoadingWidget();
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: "Full name"),
                  controller: _nameET,
                ),
                const SizedBox(
                  height: 32.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Select a Role",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      color: colorPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: RadioListTile(
                        title: const Text("Student"),
                        subtitle: const Text("Can attend Quizzes"),
                        value: 0,
                        groupValue: _role,
                        onChanged: (value) {
                          setState(() {
                            _role = value;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: const Text("Teacher"),
                        subtitle: const Text("Can create Quizzes"),
                        value: 1,
                        groupValue: _role,
                        onChanged: (value) {
                          setState(() {
                            _role = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: Text(
                    "Select an Avatar",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      color: colorPrimary,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: controller.avatars.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 6,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0),
                    itemBuilder: (context, index) {
                      return AvatarCard(
                        onTap: () {
                          setState(() {
                            _selectedAvatar = index;
                          });
                          log(_selectedAvatar.toString());
                        },
                        imageURL: controller.avatars.elementAt(index),
                        selected: index == _selectedAvatar,
                      );
                    },
                  ),
                ),
                GetBuilder<ProfileCreateController>(
                    builder: (createController) {
                  return SizedBox(
                    width: double.infinity,
                    child: Visibility(
                      visible: !createController.creatingProfile,
                      replacement: const LoadingWidget(),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_role == 0) {
                            final response = await createController.createStudent(
                                _nameET.text,
                                widget.email,
                                controller.avatars[_selectedAvatar!]);
                            if (response) {
                              Get.offAll(const StudentDashboardScreen());
                            }
                          } else {
                            final response = await createController.createTeacher(
                                _nameET.text,
                                widget.email,
                                controller.avatars[_selectedAvatar!]);
                            if (response) {
                              Get.offAll(const TeacherDashboardScreen());
                            }
                          }
                        },
                        child: const Text("Create Profile"),
                      ),
                    ),
                  );
                })
              ],
            ),
          );
        },
      ),
    );
  }
}
