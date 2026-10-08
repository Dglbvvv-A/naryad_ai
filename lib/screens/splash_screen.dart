import 'package:flutter/material.dart';
import 'role_select_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E2240),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 16,
              right: 16,
              child: Row(
                children: const [
                  Text('🇰🇿', style: TextStyle(fontSize: 20)),
                  SizedBox(width: 8),
                  Text('🇷🇺', style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(Icons.apartment, size: 48, color: Color(0xFF1E2240)),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Naryad.AI',
                    style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 32,
              left: 24,
              right: 24,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF2C335A)),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const RoleSelectScreen())),
                child: const Text('Далее', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}