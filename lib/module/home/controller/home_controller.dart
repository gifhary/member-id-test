import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:member_id_test/common/model/topic_model.dart';
import 'package:member_id_test/core/route/route_constant.dart';
import 'package:member_id_test/module/home/data/repo/home_repo.dart';
import 'package:share_plus/share_plus.dart';

class HomeController extends GetxController with HomeRepo {
  List<TopicModel> topics = [];

  @override
  void onInit() {
    super.onInit();
    _getTopics();
  }

  _getTopics() async {
    try {
      topics = await repoGetTopicList();
      debugPrint(topics.toString());
    } catch (e) {
      debugPrint('error: $e');

      Fluttertoast.showToast(msg: 'Failed fetching question topics');
    }
  }

  void onShareTap() {
    String appUrl = 'https://play-store-url.com';
    if (Platform.isIOS) {
      appUrl = 'https://app-store-url.com';
    }

    Share.share('Hey, check out this fun quiz app $appUrl');
  }

  onTopicTap() {
    if (topics.isEmpty) {
      Get.snackbar('', 'We are still fetching your topic selection :)',
          snackPosition: SnackPosition.BOTTOM,
          showProgressIndicator: true,
          progressIndicatorValueColor:
              const AlwaysStoppedAnimation<Color>(Colors.cyan));
      return;
    }
    Get.toNamed(RouteConstant.topics, arguments: topics);
  }
}
