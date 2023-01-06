import 'dart:io';

import 'package:get/get.dart';
import 'package:member_id_test/module/quiz/data/model/user_answer.dart';
import 'package:member_id_test/module/result/data/repo/result_repo.dart';
import 'package:share_plus/share_plus.dart';

class ResultController extends GetxController with ResultRepo {
  List<UserAnswer> userAnswers = [];
  int correctAnswer = 0;

  ResultController(dynamic arg) {
    if (arg.runtimeType == userAnswers.runtimeType) {
      userAnswers = arg;
      _calculateCorrectAnswer();
    }
  }

  void _calculateCorrectAnswer() {
    for (var answer in userAnswers) {
      if (answer.question.answerIndex == answer.userAnswerIndex) {
        correctAnswer++;
      }
    }
  }

  void shareScore() {
    String appUrl = 'https://play-store-url.com';
    if (Platform.isIOS) {
      appUrl = 'https://app-store-url.com';
    }

    Share.share(
        'Hey, i\'ve got $correctAnswer correct answer out of ${userAnswers.length} questions in this awesome app. Check out this fun quiz app $appUrl');
  }
}
