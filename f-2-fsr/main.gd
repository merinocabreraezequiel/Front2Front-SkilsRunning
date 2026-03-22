extends Node2D
@onready var view_1 = $HBoxContainer/SubViewportContainer/SubViewport
@onready var view_2 = $HBoxContainer/Control_P2/SubViewportContainer2/SubViewport

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Jugador 1 ve el mundo normal
	$HBoxContainer/SubViewportContainer/SubViewport/Camera_P1.rotation_degrees = 0
	# Jugador 2 ve el mundo invertido (mirando hacia el Jugador 1)
	$HBoxContainer/Control_P2/SubViewportContainer2/SubViewport/Camera_P2.rotation_degrees = 180
	
	# El Viewport 2 compartirá el "mundo" (físicas, luces, objetos) del Viewport 1
	# Nota: Usa .world_3d si tu juego es en 3D
	view_2.world_2d = view_1.world_2d

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$HBoxContainer/SubViewportContainer/SubViewport/Camera_P1.global_position = $HBoxContainer/SubViewportContainer/SubViewport/world_2d/Jugador1.global_position
	$HBoxContainer/Control_P2/SubViewportContainer2/SubViewport/Camera_P2.global_position = $HBoxContainer/SubViewportContainer/SubViewport/world_2d/Jugador2.global_position
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
