import 'package:get/get.dart';
import 'package:member_id_test/core/route/route_constant.dart';
import 'package:member_id_test/module/home/screen/home_screen.dart';
import 'package:member_id_test/module/quiz/screen/quiz_screen.dart';
import 'package:member_id_test/module/result/screen/result_screen.dart';
import 'package:member_id_test/module/topics/screen/topics_screen.dart';

class AppRoute {
  static final all = [
    GetPage(name: RouteConstant.home, page: () => const HomeScreen()),
    GetPage(name: RouteConstant.quiz, page: () => QuizScreen()),
    GetPage(name: RouteConstant.result, page: () => ResultScreen()),
    GetPage(name: RouteConstant.topics, page: () => TopicsScreen())
  ];
}
