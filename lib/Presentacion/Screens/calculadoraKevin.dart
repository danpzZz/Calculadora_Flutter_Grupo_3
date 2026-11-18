import 'package:flutter/material.dart';

class calculadoraKevin extends StatefulWidget {
  const calculadoraKevin({super.key});

  @override
  State<calculadoraKevin> createState() => _calculadoraKevinState();
}

class _calculadoraKevinState extends State<calculadoraKevin> {

  int contadorSuma = 0;
  int contadorResta = 25;
  int total = 0;

  bool calculado = false;

  void incrementar() {
    setState(() {
      contadorSuma++;
      calculado = false;
    });
  }

  void decrementar() {
    setState(() {
      if (contadorResta > 0) {
        contadorResta--;
      }
      calculado = false;
    });
  }

  void calcular() {
    setState(() {
      total = contadorResta - contadorSuma;
      calculado = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora Kevin Rivera'),
        centerTitle: true,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              const Text('Número de clicks +'),

              Text(
                '$contadorSuma',
                style: const TextStyle(fontSize: 28),
              ),

              IconButton(
                onPressed: incrementar,
                icon: const Icon(Icons.add_circle_outline),
                iconSize: 45,
              ),

              const SizedBox(height: 20),

              const Text('Número de clicks -'),

              Text(
                '$contadorResta',
                style: const TextStyle(fontSize: 28),
              ),

              IconButton(
                onPressed: decrementar,
                icon: const Icon(Icons.remove_circle_outline),
                iconSize: 45,
              ),

              const SizedBox(height: 20),

              const Text('Total'),

              Text(
                calculado ? '$total' : '---',
                style: const TextStyle(fontSize: 30),
              ),

              IconButton(
                onPressed: calcular,
                icon: const Icon(Icons.drag_handle),
                iconSize: 45,
              ),
            ],
          ),
        ),
      ),
    );
  }
}