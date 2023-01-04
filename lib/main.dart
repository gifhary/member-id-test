import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_id_test/core/route/app_route.dart';
import 'package:member_id_test/core/route/route_constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Member Id Test',
      theme: ThemeData.dark(),
      getPages: AppRoute.all,
      initialRoute: RouteConstant.home,
      defaultTransition: Transition.cupertino,
    );
  }
}
