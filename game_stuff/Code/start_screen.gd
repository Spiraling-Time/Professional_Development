extends Node2D



func _on_begin_normal_mode_button_pressed() -> void:
	get_tree().change_scene_to_file("res://game_stuff/Scenes/world.tscn")
	print("hi")
