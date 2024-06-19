import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:darturbation/src/animations/page_transition.dart';

void main() {
  testWidgets('CustomPageTransition slide test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('Test')),
          body: Center(
            child: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(CustomPageTransition(page: const Scaffold(body: Text('New Page'))));
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

  testWidgets('CustomPageTransition fade test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('Test')),
          body: Center(
            child: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      CustomPageTransition(page: const Scaffold(body: Text('New Page')), transitionType: PageTransitionType.fade),
                    );
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

  testWidgets('CustomPageTransition scale test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('Test')),
          body: Center(
            child: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      CustomPageTransition(page: const Scaffold(body: Text('New Page')), transitionType: PageTransitionType.scale),
                    );
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

  testWidgets('CustomPageTransition rotation test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('Test')),
          body: Center(
            child: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      CustomPageTransition(page: const Scaffold(body: Text('New Page')), transitionType: PageTransitionType.rotation),
                    );
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