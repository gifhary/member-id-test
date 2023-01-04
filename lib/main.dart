import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_id_test/core/route/app_route.dart';
import 'package:member_id_test/core/route/route_constant.dart';
import 'package:member_id_test/core/theme/app_button_theme.dart';
import 'package:member_id_test/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Member Id Test',
      theme: ThemeData.from(
        colorScheme: const ColorScheme.dark(),
      ).copyWith(
        scaffoldBackgroundColor: const Color(0xff182154),
        elevatedButtonTheme: AppButtonTheme.primary,
        outlinedButtonTheme: AppButtonTheme.secondary,
      ),
      getPages: AppRoute.all,
      initialRoute: RouteConstant.home,
      defaultTransition: Transition.cupertino,
    );
  }
}
