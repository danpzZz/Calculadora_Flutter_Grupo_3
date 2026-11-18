// Pruebas de la Calculadora de clicks de Camila Vivas.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_1/main.dart';

Future<void> tocar(WidgetTester tester, String boton, {int veces = 1}) async {
  for (var i = 0; i < veces; i++) {
    await tester.tap(find.text(boton));
    await tester.pump();
  }
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('Empieza con clicks + en 0 y clicks - en 25', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Camila Vivas ❤️'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);
    expect(find.text('25'), findsOneWidget);
    expect(find.text('Pulsa = para calcular'), findsOneWidget);
  });

  testWidgets('El total puede dar negativo', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tocar(tester, '+', veces: 3);
    await tocar(tester, '=');

    expect(find.text('-22'), findsOneWidget);
    expect(find.text('3 − 25 = -22 (negativo)'), findsOneWidget);
  });

  testWidgets('El total puede dar positivo', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tocar(tester, '+', veces: 30);
    await tocar(tester, '-', veces: 2);
    await tocar(tester, '=');

    expect(find.text('3'), findsOneWidget);
    expect(find.text('30 − 27 = 3 (positivo)'), findsOneWidget);
  });

  testWidgets('Avisa cuando el total quedó desactualizado', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tocar(tester, '=');
    await tocar(tester, '+');

    expect(
      find.text('Los clicks cambiaron, pulsa = otra vez'),
      findsOneWidget,
    );
  });

  testWidgets('Reiniciar vuelve a 0 y 25, y se puede deshacer', (tester) async {
    await tester.pumpWidget(const MyApp());

    await tocar(tester, '+', veces: 4);
    await tester.tap(find.byIcon(Icons.refresh));
    await tester.pumpAndSettle();

    expect(find.text('0'), findsOneWidget);
    expect(find.text('25'), findsOneWidget);

    await tester.tap(find.text('Deshacer'));
    await tester.pumpAndSettle();

    expect(find.text('4'), findsOneWidget);
  });
}
