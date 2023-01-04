
  import 'package:flutter/material.dart';
  import 'package:get/get.dart';
  import 'package:member_id_test/module/home/controller/home_controller.dart';
  
  class HomeScreen extends StatelessWidget {
    const HomeScreen({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
      return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (HomeController controller) {
          return Scaffold();
        },
      );
    }
  }