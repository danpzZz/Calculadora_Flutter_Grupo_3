import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // --- VARIABLES DE ESTADO ---
  int numClicksAdd = 0;
  int numClicksSubtract = 25;

  int get total => numClicksAdd + numClicksSubtract;

  void _incrementAdd() {
    setState(() => numClicksAdd++);
  }

  void _decrementSubtract() {
    setState(() => numClicksSubtract--);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4FF),
      appBar: AppBar(
        title: const Text('Calculadora Flutter'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 2,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: 340,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.indigo.withOpacity(0.15),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // --- SECCIÓN 1: SUMA ---
                _buildSectionTitle('Número de clicks +', Icons.add_circle_outline),
                const SizedBox(height: 12),
                _buildValueBox(
                  value: numClicksAdd.toString(),
                  onTap: _incrementAdd,
                  buttonLabel: '+',
                  buttonColor: Colors.green,
                ),

                const SizedBox(height: 25),

                // --- SECCIÓN 2: RESTA ---
                _buildSectionTitle('Número de clicks -', Icons.remove_circle_outline),
                const SizedBox(height: 12),
                _buildValueBox(
                  value: numClicksSubtract.toString(),
                  onTap: _decrementSubtract,
                  buttonLabel: '-',
                  buttonColor: Colors.redAccent,
                ),

                const SizedBox(height: 30),

                // --- SECCIÓN 3: RESULTADO TOTAL ---
                _buildSectionTitle('Total', Icons.calculate_outlined),
                const SizedBox(height: 12),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: double.infinity,
                  height: 64,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: total < 0 ? Colors.redAccent : Colors.indigo,
                      width: 1.8,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: total < 0
                        ? Colors.red.withOpacity(0.08)
                        : Colors.indigo.withOpacity(0.08),
                  ),
                  alignment: Alignment.center,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    transitionBuilder: (child, animation) =>
                        ScaleTransition(scale: animation, child: child),
                    child: Text(
                      total.toString(),
                      key: ValueKey(total),
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: total < 0 ? Colors.redAccent : Colors.indigo,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // --- PIE CON NOMBRE ---
                const Divider(),
                const SizedBox(height: 8),
                const Text(
                  'Desarrollado por',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Francisco Ramírez',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String text, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 20, color: Colors.indigo),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildValueBox({
    required String value,
    required VoidCallback onTap,
    required String buttonLabel,
    required Color buttonColor,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 190,
          height: 60,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black87, width: 1.5),
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey[50],
          ),
          alignment: Alignment.center,
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: Text(
              value,
              key: ValueKey('$buttonLabel-$value'),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            customBorder: const CircleBorder(),
            splashColor: buttonColor.withOpacity(0.3),
            child: Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: buttonColor.withOpacity(0.15),
                border: Border.all(color: buttonColor, width: 1.8),
              ),
              alignment: Alignment.center,
              child: Text(
                buttonLabel,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: buttonColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}