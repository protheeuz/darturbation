import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:darturbation/src/animations/fade_transition.dart';

void main() {
  testWidgets('FadeTransitionPage test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('Test')),
          body: Center(
            child: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(FadeTransitionPage(page: const Scaffold(body: Text('New Page'))));
                  },
                  child: const Text('Go'),
                );
              },
            ),
          ),
        ),
      ),
    );

    expect(find.text('Go'), findsOneWidget);
    await tester.tap(find.text('Go'));
    await tester.pumpAndSettle();
    expect(find.text('New Page'), findsOneWidget);
  });
}