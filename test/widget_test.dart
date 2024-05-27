import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_infinite_list_view/main.dart';

void main() {
  testWidgets('ListViewBuilder smoke test', (WidgetTester tester) async {
    // Success of the scrolling test depends on the screen size so hard-wire it
    tester.view.physicalSize = const Size(800, 600);

    await tester.pumpWidget(MainApp());

    var listViewBuilder = find.byType(ListViewBuilder);
    expect(
      listViewBuilder,
      findsOneWidget,
      reason: 'One ListViewBuilder should be present',
    );

    var listView = find.descendant(
      of: listViewBuilder,
      matching: find.byType(ListView),
    );
    expect(
      listView,
      findsOneWidget,
      reason: 'One ListView should be descendant of ListViewBuilder',
    );

    var scrollable = find.descendant(
      of: listView,
      matching: find.byType(Scrollable),
    );
    expect(
      scrollable,
      findsOneWidget,
      reason: 'One Scrollable should be descendant of ListView',
    );

    const String str0 = 'Hello World 0!';
    const String str1 = 'Hello World 100!';
    var tile0 = find.descendant(of: scrollable, matching: find.text(str0));
    var tile1 = find.descendant(of: scrollable, matching: find.text(str1));
    var arrowUpward = find.byIcon(Icons.arrow_upward);

    expect(
      arrowUpward,
      findsOneWidget,
      reason: 'One arrow_upward icon should be found',
    );

    expect(
      tile0,
      findsOneWidget,
      reason: '$str0 should be visible now',
    );
    expect(
      tile1,
      findsNothing,
      reason: '$str1 should not be visible now',
    );

    await tester.scrollUntilVisible(
      tile1,
      200,
      scrollable: scrollable,
      duration: const Duration(milliseconds: 10),
    );

    expect(
      tile0,
      findsNothing,
      reason: '$str0 should not be visible now',
    );
    expect(
      tile1,
      findsOneWidget,
      reason: '$str1 should be visible now',
    );

    await tester.tap(arrowUpward);
    await tester.pumpAndSettle();

    expect(
      tile0,
      findsOneWidget,
      reason: '$str0 should be visible now',
    );
    expect(
      tile1,
      findsNothing,
      reason: '$str1 should not be visible now',
    );
  });
}
