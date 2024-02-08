import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_recipeapp/home.dart';

import 'package:my_recipeapp/main.dart';

void main() {
  testWidgets('Test initial text', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget( HomePage());

    // Verify that the initial text is 'Home'.
    expect(find.text('Home'), findsOneWidget); // Assuming 'Home' is the initial text
    expect(find.text('Get Started'), findsNothing); // Assuming 'Get Started' is not initially displayed
  });

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(HomePage());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
