import 'package:flutter/material.dart';

import 'models/answer_button.dart';
import 'models/quiz_question.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({
    super.key,
    required this.question,
    required this.answers,
    required this.questionNumber,
    required this.totalQuestions,
    required this.onSelectAnswer,
  });

  final QuizQuestion question;
  final List<String> answers;
  final int questionNumber;
  final int totalQuestions;
  final ValueChanged<String> onSelectAnswer;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Otázka $questionNumber z $totalQuestions',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: (questionNumber - 1) / totalQuestions,
            ),
            const SizedBox(height: 28),
            Text(
              question.text,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ...answers.map(
              (answer) => AnswerButton(
                answer: answer,
                onTap: () => onSelectAnswer(answer),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
