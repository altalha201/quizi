import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/dual_text.dart';
import '../../utility/colors.dart';
import 'create_profile_screen.dart';
import 'login_screen.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
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
                    decoration: const InputDecoration(
                      hintText: "Re Enter Password",
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.off(const CreateProfileScreen());
                      },
                      child: const Text("Create Account"),
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
    );
  }
}
