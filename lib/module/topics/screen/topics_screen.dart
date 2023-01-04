import 'package:collapsible/collapsible.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:member_id_test/core/route/route_constant.dart';
import 'package:member_id_test/module/topics/controller/topics_controller.dart';
import 'package:member_id_test/module/topics/widget/sort_menu.dart';
import 'package:member_id_test/module/topics/widget/topic_item.dart';

class TopicsScreen extends StatelessWidget {
  const TopicsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TopicsController>(
      init: TopicsController(),
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
              Obx(
                () => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                  child: Column(
                    children: [
                      SortMenu(
                        currentMode: controller.currentMode.value.getName(),
                        onTap: controller.toggleSortMenu,
                      ),
                      Collapsible(
                        collapsed: controller.sortMenuCollapsed.value,
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
                      Collapsible(
                        collapsed: controller.searchCollapsed.value,
                        axis: CollapsibleAxis.both,
                        maintainAnimation: true,
                        child: TextField(
                          textInputAction: TextInputAction.search,
                          onSubmitted: controller.onSearchSubmitted,
                          decoration: const InputDecoration(
                            hintText: 'Search',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: TopicItem(
                      title: 'Politics',
                      onTap: () => Get.toNamed(RouteConstant.quiz,
                          arguments: {'topic': 1}),
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
