import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:darturbation/src/animations/loading_indicator.dart';

void main() {
  testWidgets('LoadingIndicator spinning test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LoadingIndicator(
            indicatorType: LoadingIndicatorType.spinning,
          ),
        ),
      ),
    );

    expect(find.byType(RotationTransition), findsOneWidget);
  });

  testWidgets('LoadingIndicator pulsing test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LoadingIndicator(
            indicatorType: LoadingIndicatorType.pulsing,
          ),
        ),
      ),
    );

    expect(find.byType(ScaleTransition), findsOneWidget);
  });

  testWidgets('LoadingIndicator bouncing test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: LoadingIndicator(
            indicatorType: LoadingIndicatorType.bouncing,
          ),
        ),
      ),
    );

    expect(find.byType(AnimatedBuilder), findsOneWidget);
  });
}