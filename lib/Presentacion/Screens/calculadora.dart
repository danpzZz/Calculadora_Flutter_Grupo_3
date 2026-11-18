
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Calculadora(),
  ));
}

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  int contadorClicsSuma = 0;
  int contadorClicsResta = 25;
  int total = 0;

  // Método para incrementar
  void incrementar() {
    setState(() {
      contadorClicsSuma++;
    });
  }

  // Método para decrementar
  void decrementar() {
    setState(() {
      contadorClicsResta--;
    });
  }

  // Método para calcular el total
  void calcularTotal() {
    setState(() {
      total = contadorClicsSuma - contadorClicsResta;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Contador de suma
            const Text(
              'Número de clicks +',
              style: TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 10),

            Text(
              '$contadorClicsSuma',
              style: const TextStyle(fontSize: 30),
            ),

            ElevatedButton(
              onPressed: incrementar,
              child: const Text('+'),
            ),

            const SizedBox(height: 20),

            // Contador de resta
            const Text(
              'Número de clicks -',
              style: TextStyle(fontSize: 20),
            ),

            const SizedBox(height: 10),

            Text(
              '$contadorClicsResta',
              style: const TextStyle(fontSize: 30),
            ),

            ElevatedButton(
              onPressed: decrementar,
              child: const Text('-'),
            ),

            const SizedBox(height: 20),

            // Botón para calcular total
            ElevatedButton(
              onPressed: calcularTotal,
              child: const Text('Total'),
            ),

            const SizedBox(height: 10),

            // Mostrar total
            Text(
              '$total',
              style: const TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
