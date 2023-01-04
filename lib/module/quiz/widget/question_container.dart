import 'package:flutter/material.dart';

class QuestionContainer extends StatelessWidget {
  final String question;
  final String? imgUrl;
  const QuestionContainer({Key? key, required this.question, this.imgUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 335 / 230,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              question,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            const SizedBox(height: 8),
            imgUrl == null
                ? Container()
                : Flexible(
                    child: Image.network(
                    imgUrl!,
                    width: double.maxFinite,
                    height: double.maxFinite,
                    fit: BoxFit.cover,
                  )),
          ],
        ),
      ),
    );
  }
}
