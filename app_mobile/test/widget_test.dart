// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_mobile/app/app.dart';

void main() {
  testWidgets('shows login page', (WidgetTester tester) async {
    await tester.pumpWidget(const ImperiumApp());

    expect(find.text('Imperium ERP'), findsOneWidget);
    expect(find.text('Ingresá para continuar'), findsOneWidget);
    expect(find.text('Ingresar'), findsOneWidget);
  });

  testWidgets('valid credentials navigate to dashboard', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ImperiumApp());

    await tester.enterText(find.byType(EditableText).at(0), 'admin@demo.com');
    await tester.enterText(find.byType(EditableText).at(1), 'secret');
    await tester.tap(find.text('Ingresar'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 350));
    await tester.pumpAndSettle();

    expect(find.text('Panel principal'), findsOneWidget);
  });
}
