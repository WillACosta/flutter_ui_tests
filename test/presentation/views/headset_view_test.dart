import 'package:flutter/material.dart';
import 'package:flutter_ui_tests/presentation/presentation.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens(
    'Should render Headset Toggle View correctly with Light Theme',
    (tester) async {
      await loadAppFonts();

      final builder = DeviceBuilder()
        ..addScenario(
          name: 'HeadsetView',
          widget: const HeadsetToggleView(),
        );

      await tester.pumpDeviceBuilder(
        builder,
        wrapper: materialAppWrapper(
          theme: ThemeData.light(),
          platform: TargetPlatform.android,
        ),
      );

      await screenMatchesGolden(tester, 'HeadsetView');
    },
  );

  testGoldens(
    'Headset button states should look correct',
    (tester) async {
      await loadAppFonts();

      final builder = GoldenBuilder.grid(columns: 2, widthToHeightRatio: 1)
        ..addScenario(
          'Off State',
          HeadsetButton(
            isTurnOn: false,
            onTap: () {},
          ),
        )
        ..addScenario(
          'On State',
          HeadsetButton(
            isTurnOn: true,
            onTap: () {},
          ),
        );

      await tester.pumpWidgetBuilder(builder.build());
      await screenMatchesGolden(tester, 'headset_button_states_grid');
    },
  );
}
