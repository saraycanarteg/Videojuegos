# Respuestas

## 1. Mantén D dos segundos y suéltala: ¿qué contador subió más y por qué?
Subió mucho más el contador de **cuadros con la acción pulsada**. Ese contador se revisa por sondeo en `_process`, o sea, en cada cuadro mientras D siga pulsada (unos 120 cuadros en dos segundos a 60 FPS). En cambio, los **eventos recibidos** solo llegan cuando la tecla cambia de estado: uno al pulsar y otro al soltar. El eco del teclado se ignora, así que quedan unos 2 eventos.

## 2. Mantén A: ¿qué valor muestran get_axis y get_action_strength("move_right"), y por qué difieren?
`get_axis("move_left", "move_right")` muestra **-1.00** y `get_action_strength("move_right")` muestra **0.00**. Difieren porque `get_axis` resta la fuerza de `move_left` a la de `move_right`, y como A activa `move_left`, el resultado es negativo. En cambio, `get_action_strength("move_right")` solo mide esa acción, que no está pulsada, por eso da 0.

## 3. Gira la rueda del ratón: ¿qué clase de evento aparece y por qué su rama va antes que la del clic?
Aparece **`InputEventMouseButton`**. En Godot la rueda no tiene una clase propia, llega como un botón de ratón con `button_index` igual a `MOUSE_BUTTON_WHEEL_UP` o `MOUSE_BUTTON_WHEEL_DOWN`. Su rama va antes porque tanto la rueda como un clic cumplen `event is InputEventMouseButton`. Si la rama del clic estuviera primero, atraparía también a la rueda y la mostraría como un clic. Al ponerla antes, se revisa primero el `button_index` y solo lo que no sea rueda llega a la rama del clic.
