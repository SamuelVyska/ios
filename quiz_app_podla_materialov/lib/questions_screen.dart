import 'package:flutter/material.dart';

import 'answer_button.dart';
import 'data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;
  late List<String> shuffledAnswers;

  @override
  void initState() {
    super.initState();
    shuffledAnswers = questions[0].getShuffledAnswers();
  }

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    // Po poslednej odpovedi rodič zobrazí výsledky, index už nezvyšujeme.
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        shuffledAnswers = questions[currentQuestionIndex].getShuffledAnswers();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Center(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFFE6E0F8),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(height: 30),
              ...shuffledAnswers.map((answer) {
                return AnswerButton(
                  answerText: answer,
                  onTap: () => answerQuestion(answer),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
