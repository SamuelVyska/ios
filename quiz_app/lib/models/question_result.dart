class QuestionResult {
  const QuestionResult({
    required this.number,
    required this.question,
    required this.selectedAnswer,
    required this.correctAnswer,
  });

  final int number;
  final String question;
  final String selectedAnswer;
  final String correctAnswer;

  bool get isCorrect => selectedAnswer == correctAnswer;
}
