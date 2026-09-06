import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:haleluya/main.dart';

void main() {
  testWidgets('portfolio renders resume content and gesture control', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('BRENT MICHAEL'), findsWidgets);
    expect(find.text('S. IGNACIO'), findsWidgets);
    expect(find.text('OBJECTIVE'), findsOneWidget);
    expect(find.text('SKILLS'), findsOneWidget);
    expect(find.text('Click Me'), findsOneWidget);
    expect(find.byType(GestureDetector), findsWidgets);
    expect(find.byType(ElevatedButton), findsNothing);

    await tester.ensureVisible(find.text('Click Me'));
    await tester.tap(find.text('Click Me'));
    await tester.pump(const Duration(milliseconds: 400));

    expect(find.text('Date: September 6, 2026'), findsOneWidget);
  });

  testWidgets('portfolio gestures show only their matching message', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    final clickTarget = find.text('Click Me');
    await tester.ensureVisible(clickTarget);
    await tester.doubleTap(clickTarget);
    await tester.pump();

    expect(find.text('ITP107 professor: Prof. Albert Q. Alforja'), findsOneWidget);
    expect(find.text('Date: September 6, 2026'), findsNothing);

    await tester.pumpWidget(const MyApp());
    await tester.pump();
    await tester.ensureVisible(clickTarget);
    await tester.longPress(clickTarget);
    await tester.pump();

    expect(find.text('Full name: Brent Michael S. Ignacio'), findsOneWidget);
    expect(find.text('Date: September 6, 2026'), findsNothing);
  });
}
