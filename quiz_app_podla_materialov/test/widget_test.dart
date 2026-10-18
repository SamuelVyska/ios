import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app_materialy/quiz.dart';
import 'package:quiz_app_materialy/data/questions.dart';
import 'package:quiz_app_materialy/results_screen.dart';

void main() {
  test('Dummy data a kopia pri shuffle zostavaju zachovane', () {
    expect(questions.length, 6);
    expect(questions.first.answers.first, 'Widgets');
    for (final question in questions) {
      final original = List<String>.of(question.answers);
      expect(question.getShuffledAnswers(), unorderedEquals(original));
      expect(question.answers, original);
    }
  });

  test('Summary data pouziva mapy zo vzoru a spravne priradenie', () {
    final chosen = questions.map((q) => q.answers[0]).toList();
    final summary = ResultsScreen(chosen, onRestart: () {}).getSummaryData();
    expect(summary.length, 6);
    expect(summary.first['question_index'], 0);
    expect(summary.first['user_answer'], 'Widgets');
    expect(
      summary.where((d) => d['user_answer'] == d['correct_answer']).length,
      6,
    );
  });

  testWidgets('Vsetky otazky, posledny index a restart s cistym stavom', (
    tester,
  ) async {
    await tester.pumpWidget(const Quiz());
    await tester.tap(find.text('Start Quiz'));
    await tester.pumpAndSettle();
    for (final question in questions) {
      await tester.ensureVisible(
        find.widgetWithText(ElevatedButton, question.answers[0]),
      );
      await tester.tap(
        find.widgetWithText(ElevatedButton, question.answers[0]),
      );
      await tester.pumpAndSettle();
    }
    expect(
      find.text('You answered 6 out of 6 questions correctly!'),
      findsOneWidget,
    );
    await tester.ensureVisible(find.text('Restart Quiz!'));
    await tester.tap(find.text('Restart Quiz!'));
    await tester.pumpAndSettle();
    expect(find.text(questions.first.text), findsOneWidget);
    for (var i = 0; i < questions.length; i++) {
      final answer = questions[i].answers[i.isEven ? 0 : 1];
      await tester.ensureVisible(find.widgetWithText(ElevatedButton, answer));
      await tester.tap(find.widgetWithText(ElevatedButton, answer));
      await tester.pumpAndSettle();
    }
    expect(
      find.text('You answered 3 out of 6 questions correctly!'),
      findsOneWidget,
    );
    expect(tester.takeException(), isNull);
  });
}
