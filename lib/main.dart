import 'package:flutter/material.dart';
import 'package:reawatch/pages/home_page.dart';
import 'package:reawatch/res/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MedicPedia',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.reaWatchTheme,
      home: const HomePage(),
    );
  }
}
