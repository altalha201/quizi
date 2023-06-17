import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utility/colors.dart';
import '../../widgets/dual_text.dart';
import 'create_account_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Sign In"),
                    ),
                  ),
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
    );
  }
}
