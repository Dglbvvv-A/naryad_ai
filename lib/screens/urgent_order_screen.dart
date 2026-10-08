import 'package:flutter/material.dart';
import 'order_in_progress_screen.dart';

class UrgentOrderScreen extends StatelessWidget {
  const UrgentOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E2240),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: Colors.red.shade800, borderRadius: BorderRadius.circular(12)),
                child: const Text(
                  'НОВЫЙ СРОЧНЫЙ\nНАРЯД!',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const Spacer(),
              const Text('Течь масла насоса', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('Участок обогащения №2', style: TextStyle(color: Colors.white70, fontSize: 16)),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const OrderInProgressScreen())),
                child: const Text('Принять в работу', style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2C335A),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {},
                child: const Text('Поставить в очередь', style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Отклонить', style: TextStyle(color: Colors.red, fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}