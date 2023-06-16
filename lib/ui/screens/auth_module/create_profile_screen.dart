import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/avater_controller.dart';
import '../../utility/colors.dart';
import '../../widgets/card_widgets/avatar_card.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({Key? key}) : super(key: key);

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  int? role = 0;
  int? selectedAvatar = 0;

  @override
  void initState() {
    Get.find<AvaterController>().getAvaters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Your Profile"),
        centerTitle: true,
      ),
      body: GetBuilder<AvaterController>(
        builder: (controller) {
          if (controller.gettingAvaters) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: const InputDecoration(hintText: "Full name"),
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
                        groupValue: role,
                        onChanged: (value) {
                          setState(() {
                            role = value;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RadioListTile(
                        title: const Text("Teacher"),
                        subtitle: const Text("Can create Quizzes"),
                        value: 1,
                        groupValue: role,
                        onChanged: (value) {
                          setState(() {
                            role = value;
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
                    "Select an Avater",
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
                    itemCount: controller.avaters.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0),
                    itemBuilder: (context, index) {
                      return AvatarCard(
                        onTap: () {
                          setState(() {
                            selectedAvatar = index;
                          });
                        },
                        imageURL: controller.avaters.elementAt(index),
                        selected: index == selectedAvatar,
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Create Profile"),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
