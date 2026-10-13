import 'package:flutter/material.dart';

import '../features/travel/presentation/travel_home_screen.dart';
import 'app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Du lịch',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const TravelHomeScreen(),
    );
  } // build
} // MyApp
