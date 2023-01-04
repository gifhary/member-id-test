import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:member_id_test/core/route/route_constant.dart';
import 'package:member_id_test/module/result/controller/result_controller.dart';
import 'package:member_id_test/module/result/widget/result_item.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ResultController>(
      init: ResultController(),
      builder: (ResultController controller) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            appBar: AppBar(
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
                          child: const CircularProgressIndicator(
                            value: 4 / 5,
                            color: Colors.green,
                            backgroundColor: Colors.orange,
                          ),
                        ),
                      ),
                      const Text('4/5')
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
                          borderRadius: BorderRadius.circular(4), // <-- Radius
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Share your score')),
                ),
                Center(
                  child: Text(
                    'Your Report',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                const SizedBox(height: 24),
                for (int i = 0; i < 50; i++)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: ResultItem(
                      question:
                          'questionsa df asdf asdf asd fa sdf asd fas df asdf asd fa sdf asd adsf?',
                      userAnswer: 'iya',
                      correctAnswer: 'engga',
                      correct: i % 2 == 0,
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
