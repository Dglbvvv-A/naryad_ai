import 'package:flutter/material.dart';
import 'create_order_screen.dart';

class MasterProfileScreen extends StatelessWidget {
  const MasterProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: const [
            Icon(Icons.apartment, color: Color(0xFF1E2240)),
            SizedBox(width: 8),
            Text('Профиль Мастера', style: TextStyle(color: Color(0xFF1E2240))),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const CircleAvatar(radius: 40, backgroundColor: Colors.black12),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(color: const Color(0xFF1E2240), borderRadius: BorderRadius.circular(12)),
              child: const Text('Мастер смены', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 8),
            const Text('Сидоров Петр Васильевич', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const Text('Участок: Дробление', style: TextStyle(color: Colors.grey, fontSize: 12)),
            const Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E2240),
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CreateOrderScreen()),
                );
              },
              child: const Text('Создать и выдать наряд', style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}