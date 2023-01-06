import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:member_id_test/core/route/route_constant.dart';
import 'package:member_id_test/module/result/controller/result_controller.dart';
import 'package:member_id_test/module/result/widget/result_item.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({Key? key}) : super(key: key);

  final arg = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResultController>(
      init: ResultController(arg),
      builder: (ResultController controller) {
        return WillPopScope(
          //prevent back button or gesture swipe back
          onWillPop: () async => false,
          child: Scaffold(
            appBar: AppBar(
              //override back button
              leading: BackButton(
                onPressed: () => Get.offAllNamed(RouteConstant.home),
              ),
              automaticallyImplyLeading: false,
              title: const Text('Your Score'),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            body: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 120,
                        width: 120,
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.rotationY(math.pi),
                          child: CircularProgressIndicator(
                            value: controller.correctAnswer /
                                controller.userAnswers.length,
                            color: Colors.green,
                            backgroundColor: Colors.orange,
                          ),
                        ),
                      ),
                      Text(
                          '${controller.correctAnswer}/${controller.userAnswers.length}')
                    ],
                  ),
                ),
                Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(150, 0),
                        textStyle: const TextStyle(fontSize: 14),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      onPressed: controller.shareScore,
                      child: const Text('Share your score')),
                ),
                Center(
                  child: Text(
                    'Your Report',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                const SizedBox(height: 24),
                for (var answer in controller.userAnswers)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ResultItem(
                      question: answer.question.question,
                      userAnswer: answer.userAnswerIndex == null
                          ? null
                          : answer.question.option[answer.userAnswerIndex!],
                      correctAnswer:
                          answer.question.option[answer.question.answerIndex],
                      correct:
                          answer.question.answerIndex == answer.userAnswerIndex,
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
