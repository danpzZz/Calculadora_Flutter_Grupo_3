# Calculadora Flutter

Aplicación en Flutter que simula una calculadora de clicks. Permite incrementar un contador, decrementar otro y muestra la suma total de ambos en tiempo real.

## ⚙️ ¿Qué hace la aplicación?
- **Sección "+"**: Un contador que empieza en 0 y aumenta cada vez que presionas el botón verde.
- **Sección "-"**: Un contador que empieza en 25 y disminuye cada vez que presionas el botón rojo.
- **Total**: Suma ambos contadores. Si el resultado es negativo, el número y el borde cambian a color rojo.

## 📂 Archivos importantes

- **`lib/main.dart`**
  - Es el punto de entrada. Configura el tema de la app y llama a la pantalla principal.

- **`lib/presentacion/screens/pantalla.dart`**
  - Contiene toda la interfaz visual.
  - **Lógica de estado:** Aquí están las variables `numClicksAdd`, `numClicksSubtract` y la función `total`.
  - **Acciones:** Aquí están los métodos `_incrementAdd()` y `_decrementSubtract()` que actualizan los valores con `setState()`.

## 👨‍💻 Autor
Francisco Ramírez