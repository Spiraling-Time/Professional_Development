extends CharacterBody2D


func _physics_process(delta: float) -> void:
	position = $"../Kyle".position + $"../Kyle".offset
