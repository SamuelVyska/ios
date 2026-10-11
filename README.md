# Roll-the-Dice

Flutter aplikácia pre školskú úlohu. Tlačidlo **Hodiť kockou** vyberie číslo
od 1 do 6 a zobrazí príslušný lokálny obrázok. Rovnaká hodnota môže padnúť
aj viackrát za sebou.

## Spustenie

```sh
flutter pub get
flutter run
```

Android je možné spustiť na emulátore alebo zariadení. Pre iOS je potrebný
macOS a Xcode.

## Implementácia

- `lib/main.dart`: StatefulWidget, setState a Random z dart:math.
- `assets/images/dice-1.png` až `dice-6.png`: obrázky zo zadania.
- `pubspec.yaml`: registrácia lokálnych obrázkov.
- `screenshots/`: dve rôzne hodnoty po kliknutí na tlačidlo v Android emulátore.

## Kontrola

```sh
flutter analyze
flutter test
```
