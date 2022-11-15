import 'package:first_app/question.dart';
import 'package:flutter/material.dart';

import 'answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final void Function(int) answerQuestion;

  const Quiz({
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
    super.key,
  });

  bool get isQuestionSelected {
    return questionIndex < questions.length;
  }
  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> answers = isQuestionSelected ?
        questions[questionIndex]['answers'] as List<Map<String, Object>>
        : [];
    return Column(
      children: [
        Question(
            questions[questionIndex]['questionText'] as String
        ),
        ...answers.map((resp) {
          return Answer(
            resp['text'] as String,
              () => answerQuestion(resp['score'] as int),
          );
        }).toList(),
      ],
    );
  }
}