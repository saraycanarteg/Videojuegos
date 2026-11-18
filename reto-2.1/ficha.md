# Ficha del dispositivo: Teclado

## Tecnología de captura
El teclado tiene una matriz de filas y columnas con un interruptor debajo de cada tecla (de membrana o mecánico). Un microcontrolador revisa la matriz muy rápido, detecta qué tecla cerró el circuito y envía su código al computador por USB o Bluetooth.

## Tipo de señal
**Digital.**
Cada tecla solo tiene dos estados: pulsada o suelta, no hay valores intermedios. Por eso en el Hud, `get_action_strength` da solo 0.00 o 1.00.

## Ventaja
Es muy preciso y rápido para dar órdenes concretas (moverse, saltar, atacar), y tiene muchas teclas para asignar acciones distintas.

## Limitación
No detecta cuánto se presiona una tecla, así que no permite movimientos suaves o graduales como una palanca analógica: el personaje siempre va a la misma velocidad.

## Juego ejemplo
Minecraft: se mueve con W, A, S, D y se salta con Espacio.

## Fuente
QMK Firmware, "How a Keyboard Matrix Works": https://develop-docs.qmk.fm/how_a_matrix_works
