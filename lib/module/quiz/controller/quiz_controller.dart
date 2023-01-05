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
    } catch (e) {
      debugPrint(e.toString());
      Fluttertoast.showToast(msg: 'Failed fetching questions');
    }
    loading.value = false;
  }

  _startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      debugPrint('timer running');
      if (timerElapsed.value < maxTimerSecond) {
        timerElapsed.value += 1;
      } else {
        timerElapsed.value = 0;
        debugPrint('timer ended');
        _nextQuestion();
      }
    });
  }

  //TODO handle question answer when time is up in each question

  onQuestionAnswered(int optionIndex) {
    userAnswers
        .add(UserAnswer(questions[currentQuestionIndex.value], optionIndex));

    if (currentQuestionIndex.value < questions.length - 1) {
      _nextQuestion();
    } else {
      Get.offAllNamed(RouteConstant.result, arguments: userAnswers);
    }
  }

  _nextQuestion() {
    currentQuestionIndex.value++;
  }
}
