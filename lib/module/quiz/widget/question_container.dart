import 'package:collapsible/collapsible.dart';
import 'package:flutter/material.dart';

class QuestionContainer extends StatelessWidget {
  final String question;
  final String? imgUrl;
  const QuestionContainer({Key? key, required this.question, this.imgUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
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
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Collapsible(
            collapsed: imgUrl == null,
            axis: CollapsibleAxis.both,
            maintainAnimation: true,
            child: imgUrl == null
                ? Container()
                : Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Image.network(
                      imgUrl!,
                      width: double.maxFinite,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
