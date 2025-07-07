extends CharacterBody2D

var type_of_person = "FAN1"
var mode = "MOVE"
var max_speed = 300
var speed = max_speed
var dir = Vector2.ZERO

func _physics_process(delta: float) -> void:
	if mode == "MOVE":
		#if type_of_person = "FAN1"
		$AnimationPlayer.play("Move")
		dir = ($"../../Kyle".global_position-global_position).normalized()
		velocity = dir*speed
		move_and_slide()
		
	elif mode == "RETREAT":
		$AnimationPlayer.play("Retreat")
		dir = (global_position-$"../../Kyle".global_position).normalized()

	elif mode == "CELEBRATE":
		$AnimationPlayer.play("Celebrate")

	
	


func turn_away():
	mode = "RETREAT"
	scale.x = -1


func move():
	velocity = dir*speed
	move_and_slide()
