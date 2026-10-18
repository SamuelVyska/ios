import 'package:flutter/material.dart';

import 'models/question_result.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.results});

  final List<QuestionResult> results;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: results.map((result) {
        final color = result.isCorrect ? Colors.greenAccent : Colors.redAccent;
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: color,
                child: Text(
                  '${result.number}',
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      result.question,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Tvoja odpoveď: ${result.selectedAnswer}',
                      style: TextStyle(color: color),
                    ),
                    Text(
                      'Správna odpoveď: ${result.correctAnswer}',
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
