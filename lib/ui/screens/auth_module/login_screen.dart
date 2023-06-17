import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizi/ui/controllers/get_user_controller.dart';
import 'package:quizi/ui/screens/student_module/student_dashboard_screen.dart';
import 'package:quizi/ui/screens/teacher_module/teacher_dashboard_screen.dart';

import '../../controllers/user_auth_controller.dart';
import '../../utility/colors.dart';
import '../../widgets/dual_text.dart';
import '../../widgets/loading_widget.dart';
import 'create_account_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController _emailET = TextEditingController();
  final TextEditingController _passET = TextEditingController();

  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _loginKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Image.asset(
                      "assets/images/logo.png",
                      height: 80,
                      fit: BoxFit.scaleDown,
                    )),
                    const SizedBox(
                      height: 48.0,
                    ),
                    const Text(
                      "Get Start With",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: colorPrimary),
                    ),
                    const SizedBox(
                      height: 32.0,
                    ),
                    TextFormField(
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailET,
                      decoration: const InputDecoration(
                        hintText: "Email",
                      ),
                      validator: (value) {
                        if (!EmailValidator.validate(_emailET.text.trim())) {
                          return "Enter a valid email";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      controller: _passET,
                      decoration: const InputDecoration(
                        hintText: "Password",
                      ),
                      validator: (value) {
                        if ((value?.length ?? 0) < 8) {
                          return "Password is short";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    GetBuilder<UserAuthController>(builder: (authController) {
                      return SizedBox(
                        width: double.infinity,
                        child: Visibility(
                          visible: !authController.loginProgressing,
                          replacement: const LoadingWidget(),
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_loginKey.currentState!.validate()) {
                                final response = await authController.loginUser(
                                    _emailET.text.trim(), _passET.text);
                                if (response) {
                                  final role = await Get.find<GetUserController>().getUser();
                                  if (role == "student") {
                                    Get.offAll(const StudentDashboardScreen());
                                  } else {
                                    Get.offAll(const TeacherDashboardScreen());
                                  }
                                }
                              }
                            },
                            child: const Text("Sign In"),
                          ),
                        ),
                      );
                    }),
                    const SizedBox(
                      height: 52.0,
                    ),
                    DualText(
                      question: "Have no account? ",
                      todo: "Create One",
                      onTap: () {
                        Get.off(CreateAccountScreen());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
