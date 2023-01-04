import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_id_test/module/quiz/controller/quiz_controller.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
      init: QuizController(),
      builder: (QuizController controller) {
        return Scaffold();
      },
    );
  }
}
