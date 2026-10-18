import '../models/quiz_question.dart';

const questions = [
  QuizQuestion('Ktorý jazyk používa Flutter?', [
    'Dart',
    'Java',
    'Python',
    'Swift',
  ]),
  QuizQuestion('Ktorý widget zobrazí text?', [
    'Text',
    'Image',
    'Row',
    'Container',
  ]),
  QuizQuestion('Čo zarovná obsah do stredu?', [
    'Center',
    'Column',
    'Scaffold',
    'Padding',
  ]),
  QuizQuestion('Ktorý widget má meniteľný stav?', [
    'StatefulWidget',
    'StatelessWidget',
    'Icon',
    'SizedBox',
  ]),
  QuizQuestion('Čím oznámime zmenu stavu?', [
    'setState()',
    'runApp()',
    'print()',
    'main()',
  ]),
  QuizQuestion('Kde registrujeme lokálne assets?', [
    'pubspec.yaml',
    'main.dart',
    'README.md',
    'questions.dart',
  ]),
];
