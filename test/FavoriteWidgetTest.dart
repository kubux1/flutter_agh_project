import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:touristadvisor/Favorites/FavoriteWidget.dart';

Widget wrap(Widget widget) {
  return MaterialApp(
    home: Scaffold(body: widget),
  );
}

void main() {
  testWidgets('Icon should be red after tap', (WidgetTester tester) async {
    //arrange
    await tester.pumpWidget(wrap(FavoriteWidget(checked: false)));
    final iconButtonFinder = find.byType(IconButton);

    //act
    await tester.tap(iconButtonFinder);
    await tester.pumpAndSettle();
    final icon = iconButtonFinder.evaluate().first.widget as IconButton;

    //assert
    expect(icon.color, Colors.red);
  });
}
