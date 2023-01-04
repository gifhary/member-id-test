import 'package:get/get.dart';
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
  var sortMenuCollapsed = true.obs;
  var searchCollapsed = true.obs;
  var currentMode = SortOptions.aZ.obs;

  void toggleSortMenu() {
    sortMenuCollapsed.value = !sortMenuCollapsed.value;
  }

  void toggleSearchInput() {
    searchCollapsed.value = !searchCollapsed.value;
  }

  void setSortOption(SortOptions option) {
    currentMode.value = option;
    sortMenuCollapsed.value = true;
  }

  void onSearchSubmitted(String word) {
    //
  }
}
