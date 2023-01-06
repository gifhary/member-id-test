import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:member_id_test/core/route/route_constant.dart';
import 'package:member_id_test/module/quiz/data/model/question_model.dart';
import 'package:member_id_test/module/quiz/data/model/user_answer.dart';
import 'package:member_id_test/module/quiz/data/repo/quiz_repo.dart';

class QuizController extends GetxController with QuizRepo {
  int topicId = 0;
  var timerElapsed = 0.obs;
  final maxTimerSecond = 30;
  var loading = false.obs;

  Timer? timer;

  List<QuestionModel> questions = [];

  var currentQuestionIndex = 0.obs;

  List<UserAnswer> userAnswers = [];

  QuizController(dynamic arg) {
    if (arg.runtimeType == topicId.runtimeType) {
      topicId = arg;
    }
  }

  @override
  void onInit() async {
    super.onInit();
    _getQuestions(topicId).then((_) => _startTimer());
  }

  @override
  onClose() {
    super.onClose();
    timer?.cancel();
  }

  Future<void> _getQuestions(int topicId) async {
    loading.value = true;
    try {
      questions = await repoGetQuestionList(topicId);
      if (questions.isEmpty) {
        Get.back();
        Fluttertoast.showToast(msg: 'We dont have question in this topic yet');
      } else {
        loading.value = false;
      }
    } catch (e) {
      debugPrint(e.toString());
      Get.back();
      Fluttertoast.showToast(msg: 'Failed fetching questions');
    }
  }

  _startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      debugPrint('timer running');
      if (timerElapsed.value < maxTimerSecond) {
        timerElapsed.value += 1;
      } else {
        //timer ended without answer
        onQuestionAnswered(null);
      }
    });
  }

  onQuestionAnswered(int? optionIndex) {
    timerElapsed.value = 0;
    userAnswers
        .add(UserAnswer(questions[currentQuestionIndex.value], optionIndex));

    _nextQuestion();
  }

  _nextQuestion() {
    if (currentQuestionIndex.value < questions.length - 1) {
      currentQuestionIndex.value++;
    } else {
      Get.offAllNamed(RouteConstant.result, arguments: userAnswers);
    }
  }
}
