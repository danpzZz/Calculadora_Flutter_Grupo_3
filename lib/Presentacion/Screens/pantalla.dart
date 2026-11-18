import 'package:flutter/material.dart';

class Pantalla extends StatefulWidget {
  const Pantalla({super.key});

  @override
  State<Pantalla> createState() => _PantallaState();
}

class _PantallaState extends State<Pantalla> {
  // Paleta suave (tonos pastel / difuminados).
  static const Color _rosa = Color(0xFFF8C8D8);
  static const Color _rosaTexto = Color(0xFF8E5068);
  static const Color _verde = Color(0xFF6FA882);
  static const Color _rojo = Color(0xFFD9858D);
  static const Color _morado = Color(0xFF9C88C9);

  // Valores con los que arranca la calculadora (y a los que vuelve al
  // reiniciar).
  static const int _inicioMas = 0;
  static const int _inicioMenos = 25;

  int clicksMas = _inicioMas;
  int clicksMenos = _inicioMenos;
  int? total; // null = todavía no se ha calculado

  // El total queda desactualizado si los contadores cambiaron después de
  // pulsar "=".
  bool get _totalDesactualizado =>
      total != null && total != clicksMas - clicksMenos;

  void _sumarMas() => setState(() => clicksMas++);

  void _sumarMenos() => setState(() => clicksMenos++);

  void _calcular() => setState(() => total = clicksMas - clicksMenos);

  void _reiniciar() {
    final hayDatos =
        clicksMas != _inicioMas || clicksMenos != _inicioMenos || total != null;
    if (!hayDatos) return;

    final masAnterior = clicksMas;
    final menosAnterior = clicksMenos;
    final totalAnterior = total;
    setState(() {
      clicksMas = _inicioMas;
      clicksMenos = _inicioMenos;
      total = null;
    });

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: const Text('Calculadora reiniciada'),
          behavior: SnackBarBehavior.floating,
          action: SnackBarAction(
            label: 'Deshacer',
            onPressed: () => setState(() {
              clicksMas = masAnterior;
              clicksMenos = menosAnterior;
              total = totalAnterior;
            }),
          ),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _rosa,
        foregroundColor: _rosaTexto,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text(
          'Camila Vivas ❤️',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            tooltip: 'Reiniciar',
            icon: const Icon(Icons.refresh),
            onPressed: _reiniciar,
          ),
        ],
      ),
      body: SizedBox.expand(
        child: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFFDE7EF), Color(0xFFEDE7F6)],
            ),
          ),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 420),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Calculadora de clicks',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: _morado,
                        ),
                      ),
                      const SizedBox(height: 20),
                      _Tarjeta(
                        titulo: 'Numero de clicks +',
                        valor: '$clicksMas',
                        color: _verde,
                        boton: _BotonCircular(
                          texto: '+',
                          tooltip: 'Sumar un click +',
                          color: _verde,
                          onPressed: _sumarMas,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _Tarjeta(
                        titulo: 'Numero de clicks -',
                        valor: '$clicksMenos',
                        color: _rojo,
                        boton: _BotonCircular(
                          texto: '-',
                          tooltip: 'Sumar un click -',
                          color: _rojo,
                          onPressed: _sumarMenos,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _Tarjeta(
                        titulo: 'Total',
                        valor: total == null ? '—' : '$total',
                        color: _morado,
                        destacado: true,
                        colorValor: total == null || total == 0
                            ? Colors.black87
                            : total! > 0
                            ? _verde
                            : _rojo,
                        ayuda: total == null
                            ? 'Pulsa = para calcular'
                            : _totalDesactualizado
                            ? 'Los clicks cambiaron, pulsa = otra vez'
                            : '$clicksMas − $clicksMenos = $total'
                                  '${total! > 0
                                      ? ' (positivo)'
                                      : total! < 0
                                      ? ' (negativo)'
                                      : ''}',
                        ayudaAviso: _totalDesactualizado,
                        boton: _BotonCircular(
                          texto: '=',
                          tooltip: 'Calcular total',
                          color: _morado,
                          onPressed: _calcular,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _Tarjeta extends StatelessWidget {
  const _Tarjeta({
    required this.titulo,
    required this.valor,
    required this.color,
    required this.boton,
    this.destacado = false,
    this.colorValor = Colors.black87,
    this.ayuda,
    this.ayudaAviso = false,
  });

  final String titulo;
  final String valor;
  final Color color;
  final Widget boton;
  final bool destacado;
  final Color colorValor;
  final String? ayuda;
  final bool ayudaAviso;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 16, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withValues(alpha: 0.85),
        border: Border.all(
          color: color.withValues(alpha: destacado ? 0.45 : 0.2),
          width: destacado ? 1.5 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.18),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: color,
                  ),
                ),
                const SizedBox(height: 4),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 200),
                  transitionBuilder: (child, animation) =>
                      ScaleTransition(scale: animation, child: child),
                  child: Text(
                    valor,
                    key: ValueKey(valor),
                    style: TextStyle(
                      fontSize: destacado ? 44 : 38,
                      fontWeight: FontWeight.bold,
                      color: colorValor,
                    ),
                  ),
                ),
                if (ayuda != null)
                  Text(
                    ayuda!,
                    style: TextStyle(
                      fontSize: 13,
                      color: ayudaAviso
                          ? Colors.orange.shade800
                          : Colors.black54,
                      fontWeight: ayudaAviso
                          ? FontWeight.w600
                          : FontWeight.normal,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          boton,
        ],
      ),
    );
  }
}

class _BotonCircular extends StatelessWidget {
  const _BotonCircular({
    required this.texto,
    required this.tooltip,
    required this.color,
    required this.onPressed,
  });

  final String texto;
  final String tooltip;
  final Color color;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(
          backgroundColor: Color.alphaBlend(
            color.withValues(alpha: 0.28),
            Colors.white,
          ),
          foregroundColor: color,
          shape: CircleBorder(
            side: BorderSide(color: color.withValues(alpha: 0.35)),
          ),
          fixedSize: const Size(64, 64),
          padding: EdgeInsets.zero,
          elevation: 0,
        ),
        child: Text(
          texto,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
