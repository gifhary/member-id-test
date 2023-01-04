import 'package:flutter/material.dart';

class Timer extends StatelessWidget {
  final int progress;
  final int max;
  const Timer({Key? key, this.progress = 0, this.max = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Flexible(
          child: AnimatedSize(
            duration: const Duration(seconds: 1),
            child: progress == 0 && max == 0
                ? Container()
                : Container(
                    height: 5,
                    width: width * (progress / max),
                    color: Colors.yellow,
                  ),
          ),
        ),
      ],
    );
  }
}
