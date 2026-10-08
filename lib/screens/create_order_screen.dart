import 'package:flutter/material.dart';

class CreateOrderScreen extends StatefulWidget {
  const CreateOrderScreen({super.key});

  @override
  State<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  // Контроллеры для проверки заполнения полей
  final TextEditingController _equipmentController = TextEditingController();
  final TextEditingController _workTypeController = TextEditingController();
  final TextEditingController _executorController = TextEditingController();
  final TextEditingController _normTimeController = TextEditingController();

  @override
  void dispose() {
    _equipmentController.dispose();
    _workTypeController.dispose();
    _executorController.dispose();
    _normTimeController.dispose();
    super.dispose();
  }

  void _submitOrder() {
    // Проверяем, что все поля заполнены (без учета лишних пробелов)
    bool isEquipmentValid = _equipmentController.text.trim().isNotEmpty;
    bool isWorkTypeValid = _workTypeController.text.trim().isNotEmpty;
    bool isExecutorValid = _executorController.text.trim().isNotEmpty;
    bool isNormTimeValid = _normTimeController.text.trim().isNotEmpty;

    if (!isEquipmentValid || !isWorkTypeValid || !isExecutorValid || !isNormTimeValid) {
      // Красное уведомление, если есть пустые поля
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              Icon(Icons.error_outline, color: Colors.white),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Заполните все поля!',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.red.shade700,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          duration: const Duration(seconds: 3),
        ),
      );
    } else {
      // Зеленое уведомление, если все поля заполнены
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              Icon(Icons.check_circle_outline, color: Colors.white),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Наряд выдан! Вы можете вернуться на главную.',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          backgroundColor: const Color(0xFF2E7D32),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          duration: const Duration(seconds: 4),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF1E2240)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Создание наряда',
          style: TextStyle(
            color: Color(0xFF1E2240),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInputField(
                        label: 'Оборудование / Участок',
                        hint: 'Например: Дробилка №2',
                        controller: _equipmentController,
                      ),
                      const SizedBox(height: 16),
                      _buildInputField(
                        label: 'Вид работ',
                        hint: 'Например: Замена защитного кожуха',
                        controller: _workTypeController,
                      ),
                      const SizedBox(height: 16),
                      _buildInputField(
                        label: 'Назначить исполнителя',
                        hint: 'Например: Иванов И.И.',
                        controller: _executorController,
                      ),
                      const SizedBox(height: 16),
                      _buildInputField(
                        label: 'Нормативное время (мин)',
                        hint: 'Например: 30',
                        controller: _normTimeController,
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E2240),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: _submitOrder,
                  child: const Text(
                    'Выдать наряд',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String hint,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Color(0xFF1E2240),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey.shade300),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF1E2240)),
            ),
          ),
        ),
      ],
    );
  }
}