import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Calculadora de clicks'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _clicksMas = 0; // segundo número (botón +)
  int _clicksMenos = 0; // primer número (botón -)
  int _total = 0;

  void _incrementarMas() => setState(() => _clicksMas++);
  void _incrementarMenos() => setState(() => _clicksMenos++);
  // Resta: primer número (clicks -) menos segundo número (clicks +). Ej: 4 - 6 = -2
  void _calcular() => setState(() => _total = _clicksMenos - _clicksMas);

  Widget _caja(String texto) {
    return Container(
      width: 180,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(border: Border.all()),
      child: Text(texto, style: const TextStyle(fontSize: 18)),
    );
  }

  Widget _fila(String valor, String simbolo, VoidCallback accion) {
    return Row(
      mainAxisAlignment: .center,
      children: [
        _caja(valor),
        const SizedBox(width: 16),
        SizedBox(
          width: 56,
          height: 56,
          child: OutlinedButton(
            onPressed: accion,
            style: OutlinedButton.styleFrom(
              shape: const CircleBorder(),
              padding: EdgeInsets.zero,
            ),
            child: Text(simbolo, style: const TextStyle(fontSize: 22)),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Espacio a la derecha de las etiquetas para alinearlas con las cajas de valores
    const offset = Padding(padding: EdgeInsets.only(right: 72));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          spacing: 12,
          children: [
            Row(mainAxisAlignment: .center, children: [_caja('Numero de clicks +'), offset]),
            _fila('$_clicksMas', '+', _incrementarMas),
            Row(mainAxisAlignment: .center, children: [_caja('Numero de clicks -'), offset]),
            _fila('$_clicksMenos', '-', _incrementarMenos),
            Row(mainAxisAlignment: .center, children: [_caja('Total'), offset]),
            _fila('$_total', '=', _calcular),
          ],
        ),
      ),
    );
  }
}
