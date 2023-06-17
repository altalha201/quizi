import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/user_auth_controller.dart';
import '../../widgets/dual_text.dart';
import '../../utility/colors.dart';
import '../../widgets/loading_widget.dart';
import 'create_profile_screen.dart';
import 'login_screen.dart';

class CreateAccountScreen extends StatelessWidget {
  CreateAccountScreen({Key? key}) : super(key: key);

  final TextEditingController emailET = TextEditingController();
  final TextEditingController passET = TextEditingController();

  final GlobalKey<FormState> _createKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: _createKey,
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
                      "Join With Us",
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
                      controller: emailET,
                      validator: (value) {
                        if (!EmailValidator.validate(value!.trim())) {
                          return "Enter a valid email";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Email",
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.emailAddress,
                      controller: passET,
                      validator: (value) {
                        if ((value?.length ?? 0) < 8) {
                          return "Password must be 8 characters or more";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Password",
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    TextFormField(
                      obscureText: true,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value != passET.text) {
                          return "password not matched";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: "Re Enter Password",
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: GetBuilder<UserAuthController>(
                        builder: (authController) {
                          return Visibility(
                            visible: !authController.creatingUser,
                            replacement: const LoadingWidget(),
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_createKey.currentState!.validate()) {
                                  final response = await authController.createUser(emailET.text.trim(), passET.text);
                                  if(response) {
                                    Get.off(CreateProfileScreen(email: emailET.text.trim(),));
                                  }
                                }
                              },
                              child: const Text("Create Account"),
                            ),
                          );
                        }
                      ),
                    ),
                    const SizedBox(
                      height: 52.0,
                    ),
                    DualText(
                      question: "Have an account? ",
                      todo: "Sign In",
                      onTap: () {
                        Get.off(const LoginScreen());
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
