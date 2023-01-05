import 'package:member_id_test/module/quiz/data/model/question_model.dart';
import 'package:member_id_test/module/quiz/data/network/quiz_network.dart';

class QuizRepo {
  final _myNetwork = QuizNetwork();

  Future<List<QuestionModel>> repoGetQuestionList(int topicId) async {
    try {
      return await _myNetwork.getQuestionList(topicId);
    } catch (e) {
      rethrow;
    }
  }
}
