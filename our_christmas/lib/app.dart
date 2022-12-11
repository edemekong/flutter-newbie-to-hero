import 'package:flutter/material.dart';
import 'package:our_christmas/screens/overview/overview.dart';
import 'package:our_christmas/theme/theme_data.dart';

class ChristmasApp extends StatelessWidget {
  const ChristmasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemeData.themeLight,
      home: const Overview(),
    );
  }
}
