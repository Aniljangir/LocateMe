// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:LocateMe/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('Home Screen Widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that Home screen display text and icon.
    expect(find.text('Locate Me'), findsOneWidget);
    expect(find.byIcon(Icons.menu), findsOneWidget);

    // Tap the menu icon and move to list screen.
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pump();

    // Verify that in list screen data is showing.
    expect(find.text('test'), findsNothing);
    expect(find.text('India'), findsOneWidget);
  });
  testWidgets('List Screen Widget test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Tap the menu icon and move to list screen.
    await tester.tap(find.byIcon(Icons.menu));
    await tester.pump();

    // Verify that in list screen data is showing.
    expect(find.text('India'), findsOneWidget);

    await tester.tap(find.text("India"));
    await tester.pump(const Duration(seconds: 2));

    expect(find.byIcon(Icons.menu), findsOneWidget);
  });

}
