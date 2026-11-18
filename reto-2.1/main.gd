extends Node2D

@onready var hud = $Hud

var cuadros_pulsada = 0
var eventos_recibidos = 0
var ultimo_evento = "ninguno"
var dispositivo = "ninguno"
var senal = "ninguna"

func _process(delta):
	# Sondeo: se pregunta el estado en cada cuadro
	if Input.is_action_pressed("move_right"):
		cuadros_pulsada += 1

	var jump = Input.is_action_pressed("jump")
	var eje = Input.get_axis("move_left", "move_right")
	var fuerza = Input.get_action_strength("move_right")

	hud.text = "jump: " + str(jump).to_lower() + "\n"
	hud.text += "get_axis: %.2f\n" % eje
	hud.text += "strength move_right: %.2f\n\n" % fuerza
	hud.text += "Ultimo evento: " + ultimo_evento + "\n"
	hud.text += "Dispositivo: " + dispositivo + "\n"
	hud.text += "Senal: " + senal + "\n\n"
	hud.text += "move_right cuadros pulsada (SONDEO): " + str(cuadros_pulsada) + "\n"
	hud.text += "move_right eventos recibidos (EVENTOS): " + str(eventos_recibidos)


func _input(event):
	# Ignorar el eco del teclado (repeticion al mantener pulsada)
	if event is InputEventKey and event.echo:
		return

	# Contar eventos de move_right
	if event.is_action("move_right"):
		eventos_recibidos += 1

	ultimo_evento = event.get_class()

	if event is InputEventKey:
		dispositivo = "Teclado"
		senal = "Digital"
	elif event is InputEventMouseButton and (event.button_index == MOUSE_BUTTON_WHEEL_UP or event.button_index == MOUSE_BUTTON_WHEEL_DOWN):
		# RUEDA: va antes que el clic
		dispositivo = "Raton (rueda)"
		senal = "Analogica"
	elif event is InputEventMouseButton:
		# CLIC normal
		dispositivo = "Raton (clic)"
		senal = "Digital"
