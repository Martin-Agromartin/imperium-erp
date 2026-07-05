import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:app_mobile/app/app.dart';

void main() {
  testWidgets('shows login page', (WidgetTester tester) async {
    await tester.pumpWidget(const ImperiumApp());

    expect(find.text('Imperium ERP'), findsOneWidget);
    expect(find.text('Ingresa para continuar'), findsOneWidget);
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
    expect(find.text('Actividad reciente'), findsOneWidget);
  });

  testWidgets('dashboard drawer navigates to clientes', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const ImperiumApp());

    await tester.enterText(find.byType(EditableText).at(0), 'admin@demo.com');
    await tester.enterText(find.byType(EditableText).at(1), 'secret');
    await tester.tap(find.text('Ingresar'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 350));
    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Open navigation menu'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Clientes').last);
    await tester.pumpAndSettle();

    expect(find.text('Gestion de clientes'), findsOneWidget);
    expect(find.text('Acme Distribuciones'), findsOneWidget);
  });
}
