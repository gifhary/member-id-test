
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:member_id_test/module/result/controller/result_controller.dart';
  
  class ResultScreen extends StatelessWidget {
    const ResultScreen({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return GetBuilder<ResultController>(
        init: ResultController(),
        builder: (ResultController controller) {
          return Scaffold();
        },
      );
    }
  }