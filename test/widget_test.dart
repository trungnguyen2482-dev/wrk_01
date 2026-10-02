import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/app.dart';
import 'package:flutter_application_1/features/home/presentation/home_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Shows the basic list instead of the counter demo', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Danh sách cơ bản'), findsOneWidget);
    for (final title in ['Dart', 'Widget', 'Layout', 'State', 'Git']) {
      expect(find.text(title), findsOneWidget);
    }
    expect(find.byType(ListTile), findsNWidgets(5));
    expect(find.byType(FloatingActionButton), findsNothing);
    expect(tester.takeException(), isNull);
  });

  testWidgets('Can scroll on a small screen with larger text', (tester) async {
    tester.view.physicalSize = const Size(320, 480);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MaterialApp(
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(2)),
          child: child!,
        ),
        home: const HomeScreen(),
      ),
    );
    await tester.scrollUntilVisible(
      find.text('Git'),
      150,
      scrollable: find.byType(Scrollable),
    );

    expect(find.text('Git'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
