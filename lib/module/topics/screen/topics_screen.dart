import 'package:collapsible/collapsible.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_id_test/core/route/route_constant.dart';
import 'package:member_id_test/module/topics/controller/topics_controller.dart';
import 'package:member_id_test/module/topics/widget/sort_menu.dart';
import 'package:member_id_test/module/topics/widget/topic_item.dart';

class TopicsScreen extends StatelessWidget {
  TopicsScreen({Key? key}) : super(key: key);

  final args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TopicsController>(
      init: TopicsController(args),
      builder: (TopicsController controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Topics'),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            actions: [
              IconButton(
                splashRadius: 24,
                onPressed: controller.toggleSearchInput,
                icon: const Icon(Icons.search),
              )
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                child: Column(
                  children: [
                    SortMenu(
                      currentMode: controller.currentMode.getName(),
                      onTap: controller.toggleSortMenu,
                    ),
                    Collapsible(
                      collapsed: controller.sortMenuCollapsed,
                      axis: CollapsibleAxis.both,
                      maintainAnimation: true,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            SortOptions.values.length,
                            (index) => InkWell(
                              onTap: () => controller
                                  .setSortOption(SortOptions.values[index]),
                              child: SizedBox(
                                width: double.maxFinite,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    SortOptions.values[index].getName(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => Collapsible(
                        collapsed: controller.searchCollapsed.value,
                        axis: CollapsibleAxis.both,
                        maintainAnimation: true,
                        child: TextField(
                          onChanged: controller.onSearchChanged,
                          decoration: const InputDecoration(
                            hintText: 'Search',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.displayTopics.value.length,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: TopicItem(
                        title: controller.displayTopics.value[index].name,
                        onTap: () =>
                            Get.toNamed(RouteConstant.quiz, arguments: {
                          'topicId': controller.displayTopics.value[index].id
                        }),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
