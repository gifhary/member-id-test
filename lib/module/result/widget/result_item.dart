import 'package:flutter/material.dart';

class ResultItem extends StatelessWidget {
  final String question;
  final String userAnswer;
  final String correctAnswer;
  final bool correct;
  const ResultItem(
      {Key? key,
      required this.question,
      required this.userAnswer,
      this.correct = false,
      required this.correctAnswer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(question),
        Wrap(
          children: [
            Visibility(
              visible: !correct,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                  Text(userAnswer),
                  const SizedBox(width: 5)
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.check,
                  color: Colors.green,
                ),
                Text(correctAnswer)
              ],
            ),
          ],
        )
      ],
    );
  }
}
