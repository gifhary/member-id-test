import 'package:member_id_test/common/model/topic_model.dart';
import 'package:member_id_test/module/home/data/network/home_network.dart';

class HomeRepo {
  final _myNetwork = HomeNetwork();

  Future<List<TopicModel>> repoGetTopicList() async {
    try {
      return await _myNetwork.getTopicList();
    } catch (e) {
      rethrow;
    }
  }
}
