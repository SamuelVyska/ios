import 'package:flutter/material.dart';

import 'data/questions.dart';
import 'models/question_result.dart';
import 'questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.selectedAnswers,
    required this.onRestart,
  });

  final List<String> selectedAnswers;
  final VoidCallback onRestart;

  @override
  Widget build(BuildContext context) {
    final results = questions.asMap().entries.map((entry) {
      return QuestionResult(
        number: entry.key + 1,
        question: entry.value.text,
        selectedAnswer: selectedAnswers[entry.key],
        correctAnswer: entry.value.correctAnswer,
      );
    }).toList();
    final correctCount = results.where((result) => result.isCorrect).length;

    return Column(
      children: [
        const Text(
          'Výsledky kvízu',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Text(
          'Správne odpovede: $correctCount z ${questions.length}',
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(height: 24),
        Expanded(
          child: SingleChildScrollView(
            child: QuestionsSummary(results: results),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton.icon(
          onPressed: onRestart,
          icon: const Icon(Icons.restart_alt),
          label: const Text('Restart Quiz'),
        ),
      ],
    );
  }
}
