
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:member_id_test/module/topics/controller/topics_controller.dart';
  
  class TopicsScreen extends StatelessWidget {
    const TopicsScreen({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return GetBuilder<TopicsController>(
        init: TopicsController(),
        builder: (TopicsController controller) {
          return Scaffold();
        },
      );
    }
  }