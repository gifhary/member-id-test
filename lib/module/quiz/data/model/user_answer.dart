import 'package:member_id_test/module/quiz/data/model/question_model.dart';

class UserAnswer {
  final QuestionModel question;
  final int userAnswerIndex;

  UserAnswer(this.question, this.userAnswerIndex);
}
