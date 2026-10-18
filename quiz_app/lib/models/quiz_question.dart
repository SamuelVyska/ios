class QuizQuestion {
  const QuizQuestion(this.text, this.answers);

  final String text;
  // Prvá odpoveď v dátach je správna.
  final List<String> answers;

  String get correctAnswer => answers.first;

  List<String> getShuffledAnswers() {
    final shuffledAnswers = List.of(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}
