// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:git_list_repo/Screens/Dashboard/dashboardUI.dart';

void main() {
  testWidgets('Screen Test - DashboardUI', (WidgetTester tester) async {
    //constroi o APP e chamando uma tela especifica
    await tester.pumpWidget(DashboardPage());

    //verifica se vai encontrar um texto na tela
    //chamado de LISTA REPOSITORIOS
    expect(find.text('Lista Repositorios'), findsOneWidget);
    expect(find.text('1'), findsNothing);
    /*
    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
    */
  });
}
