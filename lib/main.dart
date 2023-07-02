import 'package:flutter/material.dart';
import 'package:gfx_tool_mvismad/View/Tab_Screens/Manual_Config/manual_config1.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ManualConfig(),
    );
  }
}
