import 'package:flutter/material.dart';

import '../features/home/presentation/home_screen.dart';
import 'app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      home: const HomeScreen(),
    );
  }
}
