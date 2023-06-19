import 'package:flutter/material.dart';
import 'package:quizi/ui/widgets/appbars/logo_appbar.dart';

class PlayQuizScreen extends StatefulWidget {
  const PlayQuizScreen({Key? key, required this.quizID}) : super(key: key);

  final String quizID;

  @override
  State<PlayQuizScreen> createState() => _PlayQuizScreenState();
}

class _PlayQuizScreenState extends State<PlayQuizScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: logoAppbar(),
      body: Center(
        child: Text(widget.quizID),
      ),
    );
  }
}
