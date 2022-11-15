import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final void Function() restHandler;

  Result(this.resultScore, this.restHandler, {super.key});

  String get resultPhrase {
    var resultText = 'You did it!';
    if (resultScore <= 8) {
      resultText = 'You are awesome and innocent!';
    } else if (resultScore <= 12) {
      resultText = 'Pretty likeable!';
    } else if (resultScore <= 16) {
      resultText = 'You are strange!';
    } else {
      resultText = 'You are so bad!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text(
          resultPhrase,
          style: const TextStyle(
            fontSize: 28,
          ),
        ),
        ),
        TextButton(
            onPressed: restHandler,
            child: const Text(
              'Reset ?',
              style: TextStyle(
                fontSize: 18
              ),
            ))
      ],
    );
  }
}
