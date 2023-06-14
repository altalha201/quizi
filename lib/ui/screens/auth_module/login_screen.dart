import 'package:flutter/material.dart';

import '../../utility/other_utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(quizCoverImg),
      ),
    );
  }
}
