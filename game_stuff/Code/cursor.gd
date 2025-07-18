extends Area2D

var base_Z_Index = 3000

func _ready() -> void:
	set_z_index(base_Z_Index)
	global_position = Vector2(0,0)

func _physics_process(delta: float) -> void:
	global_position = get_global_mouse_position() 

func Z_Indexing():
	set_z_index(global_position.y + base_Z_Index)
