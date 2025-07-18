extends Area2D

var base_Z_Index = 1

func _ready() -> void:
	set_z_index(base_Z_Index)
	
	
func _physics_process(delta: float) -> void:
	Z_Indexing()
	
	for bodies in get_overlapping_bodies():
		if bodies.has_method("turn_away"):
			if bodies.mode == "MOVE" or bodies.mode == "RUN": bodies.turn_away()
			if bodies.mode == "RETREAT": bodies.move()




func Z_Indexing():
	set_z_index(global_position.y + base_Z_Index)
