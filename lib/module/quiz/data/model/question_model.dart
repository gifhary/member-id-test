import 'package:flutter/material.dart';

class QuestionModel {
  final int id;
  final String question;
  final String? imgUrl;
  final List<String> option;
  final int topicId;
  final int answerIndex;
  QuestionModel({
    required this.id,
    required this.question,
    this.imgUrl,
    required this.option,
    required this.topicId,
    required this.answerIndex,
  });

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      id: map['id'] as int,
      question: map['question'] as String,
      imgUrl: map['image'] != null ? map['image'] as String : null,
      option: (map['option'] as List).map((e) => e.toString()).toList(),
      topicId: map['topicId'] as int,
      answerIndex: map['answerIndex'] as int,
    );
  }

  @override
  String toString() {
    return 'QuestionModel(id: $id, question: $question, imgUrl: $imgUrl, option: $option, topicId: $topicId, answerIndex: $answerIndex)';
  }
}
