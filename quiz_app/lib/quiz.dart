import 'package:flutter/material.dart';

import 'data/questions.dart';
import 'questions_screen.dart';
import 'results_screen.dart';
import 'start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String _screen = 'start';
  final List<String> _selectedAnswers = [];
  List<String> _shuffledAnswers = [];

  void _startQuiz() {
    setState(() {
      _selectedAnswers.clear();
      _shuffledAnswers = questions.first.getShuffledAnswers();
      _screen = 'questions';
    });
  }

  void _chooseAnswer(String answer) {
    setState(() {
      _selectedAnswers.add(answer);
      if (_selectedAnswers.length == questions.length) {
        _screen = 'results';
      } else {
        _shuffledAnswers = questions[_selectedAnswers.length]
            .getShuffledAnswers();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreen = StartScreen(onStart: _startQuiz);

    if (_screen == 'questions') {
      activeScreen = QuestionsScreen(
        question: questions[_selectedAnswers.length],
        answers: _shuffledAnswers,
        questionNumber: _selectedAnswers.length + 1,
        totalQuestions: questions.length,
        onSelectAnswer: _chooseAnswer,
      );
    } else if (_screen == 'results') {
      activeScreen = ResultsScreen(
        selectedAnswers: _selectedAnswers,
        onRestart: _startQuiz,
      );
    }

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF293775), Color(0xFF542270)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: activeScreen,
          ),
        ),
      ),
    );
  }
}
