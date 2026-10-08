import 'package:flutter/material.dart';
import 'master_profile_screen.dart';
import 'worker_profile_screen.dart';

class AuthPinScreen extends StatefulWidget {
  final String userRole; // 'master' или 'worker'

  const AuthPinScreen({super.key, required this.userRole});

  @override
  State<AuthPinScreen> createState() => _AuthPinScreenState();
}

class _AuthPinScreenState extends State<AuthPinScreen> {
  String pin = '';

  void _onKeyPress(String value) {
    if (value == 'X') {
      if (pin.isNotEmpty) setState(() => pin = pin.substring(0, pin.length - 1));
    } else if (pin.length < 4) {
      setState(() => pin += value);
      if (pin.length == 4) {
        // Переход на экран в зависимости от роли
        if (widget.userRole == 'master') {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const MasterProfileScreen()),
            (route) => false,
          );
        } else {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => const WorkerProfileScreen()),
            (route) => false,
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E2240),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text(
              widget.userRole == 'master' ? 'Вход (Мастер)' : 'Вход (Исполнитель)',
              style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: index < pin.length ? Colors.white : Colors.white24,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text('введите ваш табельный номер', style: TextStyle(color: Colors.white54, fontSize: 12)),
            const Spacer(),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              childAspectRatio: 1.5,
              padding: const EdgeInsets.symmetric(horizontal: 40),
              children: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '', '0', 'X'].map((val) {
                if (val.isEmpty) return const SizedBox();
                return GestureDetector(
                  onTap: () => _onKeyPress(val),
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(color: Colors.white12, shape: BoxShape.circle),
                    child: Center(
                      child: Text(val, style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}