extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Jugador 1 ve el mundo normal
	$HBoxContainer/SubViewportContainer/SubViewport/Camera2D.rotation_degrees = 0
	# Jugador 2 ve el mundo invertido (mirando hacia el Jugador 1)
	$HBoxContainer/SubViewportContainer2/SubViewport/Camera2D.rotation_degrees = 180


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

# Ejemplo rápido para detectar en qué lado se toca
func _input(event):
	if event is InputEventScreenTouch:
		var screen_width = get_viewport().get_visible_rect().size.x
		if event.position.x < screen_width / 2:
			# Lógica para el Jugador 1 (Lado izquierdo)
			print("Jugador 1 tocó en: ", event.position)
		else:
			# Lógica para el Jugador 2 (Lado derecho)
			print("Jugador 2 tocó en: ", event.position)
