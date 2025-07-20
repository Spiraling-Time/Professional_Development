extends Node2D

var left_scale_swap: bool = false
var right_scale_swap: bool = false
var top_or_bottom: bool = false

var dir

func _ready() -> void:
	$AnimationPlayer.play("Idle_bottom")


func _physics_process(delta: float) -> void:
	if $"../Cursor".global_position.x >0:
		if !left_scale_swap:
			scale.x = scale.x*-1
			left_scale_swap = true
			right_scale_swap = false
	elif !right_scale_swap:
		scale.x = scale.x*-1
		left_scale_swap = false
		right_scale_swap = true

	if $"../Cursor".global_position.y <0:
		top_or_bottom = true
		if !$AnimationPlayer.is_playing():
			if Input.get_action_strength("wave") >= 1: $AnimationPlayer.play("Wave_top")
			else: $AnimationPlayer.play("Idle_top")

	else:
		top_or_bottom = false
		if !$AnimationPlayer.is_playing():
			if Input.get_action_strength("wave") >= 1: $AnimationPlayer.play("Wave_bottom")
			else: $AnimationPlayer.play("Idle_bottom")


func wave_colliding():
	$"../Wave/CollisionShape2D".disabled = false
	dir = ($"../Wave".global_position-get_global_mouse_position()).normalized()
	$"../Wave".rotation = dir.angle()

func wave_stop_colliding():
	$"../Wave/CollisionShape2D".disabled = true
