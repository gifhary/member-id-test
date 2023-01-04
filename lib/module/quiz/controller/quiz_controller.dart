import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_id_test/module/quiz/data/repo/quiz_repo.dart';

class QuizController extends GetxController with QuizRepo {
  var timerElapsed = 0.obs;
  final maxTimerSecond = 30;

  @override
  void onInit() {
    super.onInit();
    _startTimer();
  }

  _startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerElapsed.value < maxTimerSecond) {
        timerElapsed.value += 1;
      } else {
        timerElapsed.value = 0;
        debugPrint('timer ended');
        _nextQuestion(timer);
      }
    });
  }

  _nextQuestion(Timer timer) {
    //
  }
}
