extends Node2D

var left_scale_swap: bool = false
var right_scale_swap: bool = false
var top_or_bottom: bool = false

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
		$AnimationPlayer.play("Idle_top")
	else:
		top_or_bottom = false
		$AnimationPlayer.play("Idle_bottom")
