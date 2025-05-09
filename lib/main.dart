import 'package:flutter/material.dart';
import 'package:onequiz/screens/home_screen.dart';

import 'core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}