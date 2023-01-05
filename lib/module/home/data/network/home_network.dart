import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:member_id_test/common/model/topic_model.dart';

class HomeNetwork {
  Future<List<TopicModel>> getTopicList() async {
    try {
      final collection = FirebaseFirestore.instance.collection('/topic');
      final res = await collection.get();

      return res.docs.map((e) => TopicModel.fromMap(e.data())).toList();
    } catch (e) {
      rethrow;
    }
  }
}
