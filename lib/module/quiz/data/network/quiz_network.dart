import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:member_id_test/module/quiz/data/model/question_model.dart';

class QuizNetwork {
  Future<List<QuestionModel>> getQuestionList(int topicId) async {
    try {
      final collection = FirebaseFirestore.instance.collection('/question');
      final res = await collection.where('topicId', isEqualTo: topicId).get();

      return res.docs.map((e) => QuestionModel.fromMap(e.data())).toList();
    } catch (e) {
      rethrow;
    }
  }
}
