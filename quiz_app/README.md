# Quiz App - hodina 4, úloha 1c

Repozitár: https://github.com/SamuelVyska/ios/tree/main/quiz_app

Jednoduchý kvíz so šiestimi otázkami o Flutteri. Má úvodnú obrazovku,
otázky a výsledky so správnymi aj vybranými odpoveďami. Restart Quiz
vymaže odpovede a začne nový kvíz od prvej otázky.

## Spustenie

```sh
flutter pub get
flutter run
```

Android možno spustiť na emulátore. iOS potrebuje macOS a Xcode.

## Ako funguje

- `quiz.dart`: StatefulWidget, setState, zvolené odpovede a prepínanie obrazoviek.
- `data/questions.dart`: štruktúrované otázky, prvá odpoveď v dátach je správna.
- `models/quiz_question.dart`: premieša kópiu odpovedí cez shuffle().
- `questions_screen.dart`: odpovede vytvára cez map() a spread operátor `...`.
- `results_screen.dart`: mapovanie odpovedí a počet správnych cez where().length.
- `questions_summary.dart`: rolovateľný prehľad s Row a Expanded.
- `screenshots/`: skutočné screenshoty z Android emulátora.

Poradie otázok je pevné, poradie odpovedí sa premieša pri každej novej otázke.
Premiešanie nemení pôvodné dáta a správna odpoveď sa kontroluje podľa textu.

## Kontrola

```sh
flutter analyze
flutter test
```
