import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_ui_tests/main.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('should render app and deal with button interaction', () {
    testWidgets(
      'Should change headset button state when tap',
      (tester) async {
        await tester.pumpWidget(const FlutterUiTestsApp());

        final buttonComponent = find.byKey(const Key('headset-button'));
        expect(buttonComponent, findsOneWidget);

        final disabledIcon = find.byIcon(Icons.headset_off);
        expect(disabledIcon, findsOneWidget);

        await tester.tap(buttonComponent);
        await tester.pumpAndSettle();

        final enabledIcon = find.byIcon(Icons.headset);
        expect(enabledIcon, findsOneWidget);
      },
    );
  });
}
