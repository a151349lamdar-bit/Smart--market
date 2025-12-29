import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('آزمون اول', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Text('آزمون'),
    ));
  });
}
