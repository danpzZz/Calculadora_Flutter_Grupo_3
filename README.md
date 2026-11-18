# Calculadora de clicks — Camila Vivas ❤️

Trabajo de clase de Flutter (Programación V, Grupo 3).

## ¿Qué hace?

| Sección | Valor inicial | Botón |
|---|---|---|
| Numero de clicks + | 0 | **+** suma 1 |
| Numero de clicks - | 25 | **-** suma 1 |
| Total | — | **=** calcula `clicks + − clicks -` |

El total puede dar **positivo** (verde) o **negativo** (rojo).
Ejemplo: 3 clicks en + → `3 − 25 = -22`; 30 clicks en + y 2 en - → `30 − 27 = 3`.

## Extras

- Aviso cuando los clicks cambian después de pulsar **=**.
- Botón para reiniciar (vuelve a 0 y 25) con opción de **Deshacer**.
- Diseño en colores pastel con animación en los números.

## Cómo ejecutarlo

```
flutter pub get
flutter run
```

Pruebas:

```
flutter test
```

## Archivos principales

- `lib/main.dart` — arranca la app.
- `lib/Presentacion/Screens/pantalla.dart` — la calculadora.
- `test/widget_test.dart` — pruebas de la calculadora.
