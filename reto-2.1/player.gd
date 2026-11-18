extends CharacterBody2D

@export var speed = 300.0


func _physics_process(delta):
	var direccion = Input.get_axis("move_left", "move_right")
	velocity.x = direccion * speed
	move_and_slide()
