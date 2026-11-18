
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
  int numero1 = 0;
  int numero2 = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de Daniel"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Sumar +"),
            Text("$numero1"),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  numero1++;
                });
              },
              child: const Text("+"),
            ),

            const SizedBox(height: 30),

            const Text("Restar -"),
            Text("$numero2"),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  numero2--;
                });
              },
              child: const Text("-"),
            ),

            const SizedBox(height: 30),

            const Text("Total"),
            Text("${numero1 - numero2}"),
          ],
        ),
      ),
    );
  }
}
