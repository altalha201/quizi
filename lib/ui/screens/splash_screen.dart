import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:quizi/ui/controllers/quiz_theme_controller.dart';

import '../controllers/avatar_controller.dart';
import '../controllers/cache_controller.dart';
import '../controllers/get_user_controller.dart';
import '../utility/colors.dart';
import 'home_screen.dart';
import 'student_module/student_dashboard_screen.dart';
import 'teacher_module/teacher_dashboard_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Get.find<AvatarController>().getAvatars();
    Get.find<QuizThemeController>().getThemes();
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      if (!Get.find<CacheController>().isLogin()) {
        Get.offAll(
            const HomeScreen(), transition: Transition.leftToRightWithFade);
      } else {
        final getRole = await Get.find<GetUserController>().getUser();
        if(getRole == 'student') {
          Get.offAll(const StudentDashboardScreen());
        } else if (getRole == 'teacher') {
          Get.offAll(const TeacherDashboardScreen());
        } else {
          Get.find<CacheController>().logout();
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              fit: BoxFit.scaleDown,
              width: 100,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LoadingAnimationWidget.stretchedDots(
                color: colorPrimary,
                size: 65,
              ),
              const SizedBox(
                height: 24,
                width: double.infinity,
              )
            ],
          )
        ],
      ),
    );
  }
}
