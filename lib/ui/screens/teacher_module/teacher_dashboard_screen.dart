import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:quizi/ui/controllers/teacher_module/get_teachers_quiz_list_controller.dart';
import 'package:quizi/ui/screens/teacher_module/tabs/create_quiz_tab.dart';
import 'package:quizi/ui/screens/teacher_module/tabs/home_tab.dart';
import 'package:quizi/ui/screens/teacher_module/tabs/participents_list_tab.dart';
import 'package:quizi/ui/utility/colors.dart';

import '../../controllers/get_user_controller.dart';
import '../../controllers/teacher_module/home_tab_controller.dart';
import '../../widgets/appbars/logo_appbar.dart';
import '../../widgets/card_widgets/teacher_profile_widget.dart';
import '../../widgets/loading_widget.dart';

class TeacherDashboardScreen extends StatefulWidget {
  const TeacherDashboardScreen({Key? key}) : super(key: key);

  @override
  State<TeacherDashboardScreen> createState() => _TeacherDashboardScreenState();
}

class _TeacherDashboardScreenState extends State<TeacherDashboardScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Get.find<GetUserController>().getTeacher();
      await Get.find<GetTeachersQuizListController>().getNormalList();
    });
    super.initState();
  }

  final List<Widget> tabs = [
    const ParticipantsListTab(),
    const HomeTab(),
    const CreateQuizTab()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: logoAppbar(),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: GetBuilder<GetUserController>(
                builder: (profileController) {
                  if (profileController.gettingProfile) {
                    return const LoadingWidget();
                  }
                  return TeacherProfileCard(
                    teacher: profileController.teacherProfile,
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0,),
            Expanded(
                child: GetBuilder<HomeTabController>(
              builder: (tabController) {
                return tabs[tabController.selectedTab];
              },
            )),
          ],
        ),
      ),
      bottomNavigationBar: GetBuilder<HomeTabController>(
        builder: (tabController) {
          return MoltenBottomNavigationBar(
            borderSize: 2,
            borderColor: colorPrimary,
            borderRaduis: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            tabs: [
              MoltenTab(icon: const Icon(Icons.list)),
              MoltenTab(icon: const Icon(Icons.home)),
              MoltenTab(icon: const Icon(Icons.add)),
            ],
            selectedIndex: tabController.selectedTab,
            onTabChange: (int index) {
              tabController.changeTab(index);
            },
          );
        }
      ),
    );
  }
}
