import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_id_test/core/route/route_constant.dart';
import 'package:member_id_test/module/quiz/controller/quiz_controller.dart';
import 'package:member_id_test/module/quiz/widget/question_container.dart';
import 'package:member_id_test/module/quiz/widget/timer.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
      init: QuizController(),
      builder: (QuizController controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Quiz Page'),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            actions: [
              IconButton(
                splashRadius: 24,
                onPressed: () => Get.offAllNamed(RouteConstant.home),
                icon: const Text('Exit'),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Obx(
                  () => Timer(
                    progress: controller.timerElapsed.value,
                    max: controller.maxTimerSecond,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: const [
                      QuestionContainer(
                        question: 'Which is the fastest animal on land?',
                        imgUrl:
                            'https://thumbs.dreamstime.com/b/cheetah-large-wild-male-chetah-sneering-96377919.jpg',
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
