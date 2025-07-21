extends Node2D

var save_first_time = "user://variable.save_first_time"

var started: bool = false

var counter_of_important_stuff = 0

func _ready() -> void:
	#save_start()
	load_data_start()
	if !started:
		_on_introduction_button_pressed()

func save_start():
	var file = FileAccess.open(save_first_time, FileAccess.WRITE)
	file.store_var(started)


func load_data_start():
	if FileAccess.file_exists(save_first_time):
		var file = FileAccess.open(save_first_time, FileAccess.READ)
		started = file.get_var()


func _on_begin_normal_mode_button_pressed() -> void:
	get_tree().change_scene_to_file("res://game_stuff/Scenes/world.tscn")


func hide_em_all():
	$Normal_sprite.visible = false
	$Normal_info_sprite.visible = false
	$Credits_sprite.visible = false
	$Instructions.visible = false
	$Introduction.visible = false

func show_em_all():
	$Normal_sprite.visible = true
	$Normal_info_sprite.visible = true
	$Credits_sprite.visible = true
	$Instructions.visible = true
	$Introduction.visible = true

func _on_expanded_info_normal_pressed() -> void:
	$Normal_Info_expanded.visible = false
	$Credits_expanded.visible = false
	$"Instructions Expanded".visible = false
	$Introduction_Expanded.visible = false
	
	show_em_all()
	
	if !started:
		counter_of_important_stuff += 1
		if counter_of_important_stuff == 1:
			_on_instructions_button_pressed()
		elif counter_of_important_stuff == 2:
			started = true
			save_start()
			_on_normal_info_button_pressed()
			

func _on_normal_info_button_pressed() -> void:
	$Normal_Info_expanded.visible = true

	hide_em_all()





func _on_credits_button_pressed() -> void:
	$Credits_expanded.visible = true

	hide_em_all()


func _on_instructions_button_pressed() -> void:
	$"Instructions Expanded".visible = true
	hide_em_all()


func _on_introduction_button_pressed() -> void:
	$Introduction_Expanded.visible = true
	
	hide_em_all()


func _on_audio_stream_player_2d_finished() -> void:
	$AudioStreamPlayer2D.play()
