import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_id_test/core/assets/app_asset.dart';
import 'package:member_id_test/core/route/route_constant.dart';
import 'package:member_id_test/module/home/controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (HomeController controller) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppAsset.bulb,
                          height: 100,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 40, bottom: 16),
                          child: Text(
                            'Flutter Quiz App',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        const Text('Learn · Take Quiz · Repeat'),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('PLAY'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.maxFinite,
                    child: OutlinedButton(
                      onPressed: () => Get.toNamed(RouteConstant.topics),
                      child: const Text('TOPICS'),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Flexible(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(40),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.share,
                                  color: Colors.lightBlue,
                                ),
                                Text('Share')
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(40),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                ),
                                Text('Rate Us')
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
