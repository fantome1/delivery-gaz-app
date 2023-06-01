import 'package:flutter/material.dart';
import 'package:gaz_app/onboarding_page.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon Gaz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: backgroundColor),
        useMaterial3: true,
      ),
      home: const OnboardingPage(),
    );
  }
}
