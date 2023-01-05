import 'package:get/get.dart';
import 'package:member_id_test/common/model/topic_model.dart';
import 'package:member_id_test/module/topics/data/repo/topics_repo.dart';

enum SortOptions { aZ, zA }

extension SortOptionExtension on SortOptions {
  String getName() {
    switch (this) {
      case SortOptions.aZ:
        return 'A-Z';
      case SortOptions.zA:
        return 'Z-A';
      default:
        return '';
    }
  }
}

class TopicsController extends GetxController with TopicsRepo {
  var searchCollapsed = true.obs;
  bool sortMenuCollapsed = true;
  SortOptions currentMode = SortOptions.aZ;

  List<TopicModel> topics = [];
  Rx<List<TopicModel>> displayTopics = Rx<List<TopicModel>>([]);

  TopicsController(dynamic arg) {
    if (arg.runtimeType == topics.runtimeType) {
      topics = arg;
      displayTopics.value.addAll(topics);
      setSortOption(currentMode);
    }
  }

  void toggleSortMenu() {
    sortMenuCollapsed = !sortMenuCollapsed;
    update();
  }

  void toggleSearchInput() {
    searchCollapsed.value = !searchCollapsed.value;
  }

  void setSortOption(SortOptions option) {
    currentMode = option;
    sortMenuCollapsed = true;
    switch (option) {
      case SortOptions.aZ:
        displayTopics.value.sort(
            (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
        break;
      case SortOptions.zA:
        displayTopics.value.sort(
            (a, b) => b.name.toLowerCase().compareTo(a.name.toLowerCase()));
        break;
      default:
    }
    update();
  }

  void onSearchChanged(String word) {
    displayTopics.value = topics
        .where((element) =>
            element.name.toLowerCase().contains(word.toLowerCase()))
        .toList();
    update();
  }
}
