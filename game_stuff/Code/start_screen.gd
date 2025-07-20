extends Node2D



func _on_begin_normal_mode_button_pressed() -> void:
	get_tree().change_scene_to_file("res://game_stuff/Scenes/world.tscn")


func _on_normal_info_button_pressed() -> void:
	$Normal_Info_expanded.visible = true
	$"Expanded Info Normal".visible = true


func _on_expanded_info_normal_pressed() -> void:
	$Normal_Info_expanded.visible = false
	$"Expanded Info Normal".visible = false
