import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quiz_app/main.dart';
import 'package:quiz_app/data/questions.dart';

void main() {
  test('Premiesanie zachova vsetky odpovede a povodne poradie dat', () {
    for (final question in questions) {
      final original = List<String>.of(question.answers);
      expect(question.getShuffledAnswers(), unorderedEquals(original));
      expect(question.answers, original);
      expect(question.correctAnswer, original.first);
    }
  });

  testWidgets('Cely kviz, spravne skore a restart bez starych odpovedi', (
    tester,
  ) async {
    await tester.pumpWidget(const QuizApp());
    await tester.tap(find.text('Start Quiz'));
    await tester.pumpAndSettle();

    for (final question in questions) {
      expect(find.text(question.text), findsOneWidget);
      await tester.tap(
        find.widgetWithText(ElevatedButton, question.correctAnswer),
      );
      await tester.pumpAndSettle();
    }
    expect(find.text('Správne odpovede: 6 z 6'), findsOneWidget);
    await tester.tap(find.text('Restart Quiz'));
    await tester.pumpAndSettle();
    expect(find.text('Otázka 1 z 6'), findsOneWidget);

    for (var i = 0; i < questions.length; i++) {
      final answer = questions[i].answers[i.isEven ? 0 : 1];
      await tester.tap(find.widgetWithText(ElevatedButton, answer));
      await tester.pumpAndSettle();
    }
    expect(find.text('Správne odpovede: 3 z 6'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
