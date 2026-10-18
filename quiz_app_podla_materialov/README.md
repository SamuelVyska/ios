# Úloha 1c - verzia podľa materiálov

Samostatná verzia vedľa pôvodného quiz_app. Vychádza z informačných stránok
„i“ oboch otvorených testov: Seminár 4 - Zadanie 1a a Zadanie 1b.
Zadanie 1c je výsledná kompletná aplikácia z týchto stavebných krokov.

Konkrétne podklady (číslovanie strán od 1): test 1a, strany 32 a 40
pre dáta a AnswerButton; test 1b, strany 10, 22, 31, 37, 43 a 46
pre shuffle, callback, mapy, pretypovanie, filtrovanie a posúvanie súhrnu.

Použité sú pôvodné anglické dummy data zo strany 32 testu 1a a logo
z assets.zip. Prvá odpoveď v dátach je správna. List.of + shuffle mieša
iba kópiu zoznamu. AnswerButton používa answerText/onTap a štýl zo vzoru.

Quiz spravuje activeScreen a selectedAnswers. QuestionsScreen má vlastný
currentQuestionIndex a odovzdáva odpoveď rodičovi cez onSelectAnswer.
ResultsScreen.getSummaryData používa for a List<Map<String, Object>>,
počet správnych počíta cez where().length. QuestionsSummary používa
pretypovanie as int/as String, Row/Column/Expanded a scroll vo výške 300.

Spustenie: flutter pub get, potom flutter run.
Kontrola: flutter analyze, flutter test.
Screenshoty sú v screenshots/.

V súhrne ružový text znamená vybranú odpoveď, modrý správnu odpoveď.
Farba čísla otázky odlišuje správne a nesprávne riešenie.

Úpravy potrebné na finálnu funkčnú aplikáciu: posledná odpoveď už nezvýši
index mimo zoznamu, Restart Quiz! vymaže odpovede a začne od prvej otázky.
Odpovede sa miešajú len pri otvorení otázky, aby pri prekreslení neskákali.
Systémový Roboto používa TextStyle z materiálov; Google Fonts je v texte
ponúknutá alternatíva a nie je potrebná ďalšia knižnica ani pripojenie.
Android zostavenie je overené; iOS vyžaduje macOS a Xcode.
