import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rpn_calculator/calculator_screen.dart';

void main() {
  testWidgets('Calculator Screen Initial State Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CalculatorScreen()));

    expect(find.text('RPN Calculator'), findsOneWidget);
    expect(find.text('Result: 0'), findsOneWidget);
    expect(find.text('2'), findsOneWidget);
  });

  testWidgets('Calculator Screen Addition Test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CalculatorScreen()));

    await tester.tap(find.text('5'));
    await tester.tap(find.text('5'));
    await tester.tap(find.text('+'));
    await tester.pumpAndSettle();

    expect(find.text('Result: 10.0'), findsOneWidget);
  });
}

