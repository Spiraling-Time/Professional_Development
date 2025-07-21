extends "res://game_stuff/Code/fan_and_role.gd"

func _ready() -> void:
	type_of_person = "FAN1"
	role = false
	mode = "RUN"
	max_speed = 300
	speed = max_speed
	dir = Vector2.ZERO
