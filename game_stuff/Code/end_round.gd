extends Button



func _physics_process(delta: float) -> void:
	if Input.get_action_strength("exit") >= 1:
		get_tree().paused = false
		get_tree().change_scene_to_file("res://game_stuff/Scenes/start_screen.tscn")
