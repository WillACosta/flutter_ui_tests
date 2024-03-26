import 'package:flutter/material.dart';
import 'package:flutter_ui_tests/presentation/views/headset_view.dart';

import 'presentation/theme/theme_data.dart';

void main() {
  runApp(const FlutterUiTestsApp());
}

class FlutterUiTestsApp extends StatelessWidget {
  const FlutterUiTestsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Ui Testes Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
      darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      home: const HeadsetToggleView(),
    );
  }
}
