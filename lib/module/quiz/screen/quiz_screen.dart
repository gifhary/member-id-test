import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_id_test/core/route/route_constant.dart';
import 'package:member_id_test/module/quiz/controller/quiz_controller.dart';
import 'package:member_id_test/module/quiz/widget/answer_option.dart';
import 'package:member_id_test/module/quiz/widget/question_container.dart';
import 'package:member_id_test/module/quiz/widget/timer.dart';

class QuizScreen extends StatelessWidget {
  QuizScreen({Key? key}) : super(key: key);

  final arg = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(
      init: QuizController(arg),
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
          body: Obx(() => controller.loading.value
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Timer(
                        progress: controller.timerElapsed.value,
                        max: controller.maxTimerSecond,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Column(
                          children: [
                            QuestionContainer(
                              question: controller
                                  .questions[
                                      controller.currentQuestionIndex.value]
                                  .question,
                              imgUrl: controller
                                  .questions[
                                      controller.currentQuestionIndex.value]
                                  .imgUrl,
                            ),
                            const SizedBox(height: 32),
                            for (int i = 0;
                                i <
                                    (controller
                                            .questions[controller
                                                .currentQuestionIndex.value]
                                            .option)
                                        .length;
                                i++)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 14),
                                child: AnswerOption(
                                  onTap: () => controller.onQuestionAnswered(i),
                                  title: controller
                                      .questions[
                                          controller.currentQuestionIndex.value]
                                      .option[i],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
        );
      },
    );
  }
}
