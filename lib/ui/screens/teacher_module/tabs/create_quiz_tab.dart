import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizi/ui/controllers/get_user_controller.dart';
import 'package:quizi/ui/screens/quiz_module/create_new_quiz_screen.dart';
import 'package:quizi/ui/widgets/card_widgets/theme_card.dart';

import '../../../controllers/quiz_theme_controller.dart';
import '../../../utility/colors.dart';
import '../../../widgets/loading_widget.dart';
import '../../../widgets/quiz_widgets/date_picker_box.dart';

class CreateQuizTab extends StatefulWidget {
  const CreateQuizTab({Key? key}) : super(key: key);

  @override
  State<CreateQuizTab> createState() => _CreateQuizTabState();
}

class _CreateQuizTabState extends State<CreateQuizTab> {
  int? _selectedTheme = 0;
  bool _liveQuiz = false;

  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();
  final TextEditingController _titleET = TextEditingController();

  final GlobalKey<FormState> _titleKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (Get.find<QuizThemeController>().themes.isEmpty) {
      Get.find<QuizThemeController>().getThemes();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizThemeController>(builder: (themeController) {
      if (themeController.gettingThemes) {
        return const LoadingWidget();
      }
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Create a New Quiz",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: colorPrimary,
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Form(
              key: _titleKey,
              child: TextFormField(
                controller: _titleET,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(hintText: "Quiz Title"),
                validator: (value) {
                  if(value!.isEmpty) {
                    return "Quiz title required";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Select a quiz theme",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: themeController.themes.length,
                itemBuilder: (context, index) {
                  return ThemeCard(
                    imgURL: themeController.themes.elementAt(index),
                    selected: index == _selectedTheme,
                    onTap: () {
                      setState(() {
                        _selectedTheme = index;
                      });
                    },
                  );
                },
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: _liveQuiz,
                  onChanged: (value) {
                    setState(() {
                      _liveQuiz = value!;
                    });
                  },
                ),
                const SizedBox(
                  width: 4.0,
                ),
                const Text(
                  "Make it live",
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            Visibility(
              visible: _liveQuiz,
              child: Row(
                children: [
                  DatePickerBox(
                    hint: "Start Date",
                    controller: _startDateController,
                  ),
                  const SizedBox(width: 8.0),
                  DatePickerBox(
                      hint: "End Date", controller: _endDateController),
                ],
              ),
            ),
            Visibility(
              visible: _liveQuiz,
              child: const SizedBox(
                height: 16.0,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_titleKey.currentState!.validate()) {
                    final teacher =
                        Get.find<GetUserController>().teacherProfile;
                    if (_liveQuiz) {
                      Get.to(CreateNewQuizScreen(
                        creatorName: teacher.userName!,
                        title: _titleET.text,
                        themeURL: themeController.themes[_selectedTheme!],
                        isLive: true,
                        creatorID: teacher.uid!,
                        startDate: _startDateController.text,
                        endDate: _endDateController.text,
                      ));
                    } else {
                      Get.to(CreateNewQuizScreen(
                        creatorName: teacher.userName!,
                        title: _titleET.text,
                        themeURL: themeController.themes[_selectedTheme!],
                        isLive: false,
                        creatorID: teacher.uid!,
                      ));
                    }
                  }
                },
                child: const Text("Create Quiz"),
              ),
            )
          ],
        ),
      );
    });
  }
}
