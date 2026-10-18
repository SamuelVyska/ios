import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.onStart});

  final VoidCallback onStart;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.quiz_outlined, size: 96, color: Colors.white),
          const SizedBox(height: 24),
          const Text(
            'Quiz App',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          const Text(
            'Otestuj svoje znalosti Flutteru v 6 otázkach.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: onStart,
            icon: const Icon(Icons.arrow_forward),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
