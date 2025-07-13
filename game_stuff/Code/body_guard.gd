extends Area2D

func _physics_process(delta: float) -> void:
	for bodies in get_overlapping_bodies():
		if bodies.has_method("turn_away"):
			if bodies.mode == "MOVE" or bodies.mode == "RUN": bodies.turn_away()
			if bodies.mode == "RETREAT": bodies.move()
