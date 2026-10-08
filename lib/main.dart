import 'package:flutter/material.dart';
import '../screens/splash_screen.dart';

void main() {
  runApp(const NaryadAiApp());
}

class NaryadAiApp extends StatelessWidget {
  const NaryadAiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Naryad.AI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF1E2240),
        fontFamily: 'serif',
        primaryColor: const Color(0xFF1E2240),
      ),
      home: const SplashScreen(),
    );
  }
}