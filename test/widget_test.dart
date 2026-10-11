import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:roll_the_dice/main.dart';

void main() {
  testWidgets('Kazdy hod zobrazi platnu hodnotu a zodpovedajuci asset', (
    tester,
  ) async {
    await tester.pumpWidget(const DiceApp());
    expect(find.text('Hodnota: 1'), findsOneWidget);
    for (var i = 0; i < 30; i++) {
      await tester.tap(find.text('Hodiť kockou'));
      await tester.pump();
      final label = tester.widget<Text>(find.textContaining('Hodnota:')).data!;
      final value = int.parse(label.split(': ').last);
      expect(value, inInclusiveRange(1, 6));
      final image = tester.widget<Image>(find.byType(Image));
      expect(
        (image.image as AssetImage).assetName,
        'assets/images/dice-$value.png',
      );
      expect(tester.takeException(), isNull);
    }
  });
}
