extends CharacterBody2D

var type_of_person
var role
var mode
var max_speed
var speed
var dir

func _physics_process(delta: float) -> void:
	if mode == "MOVE":
		#if type_of_person = "FAN1"
		$AnimationPlayer.play("Move")
		dir = ($"../../Kyle".global_position-global_position).normalized()
		if role: velocity = dir*speed/2
		else: velocity = dir*speed
		velocity = dir*speed
		move_and_slide()

	elif mode == "RUN":
		#if type_of_person = "FAN1"
		$AnimationPlayer.play("Run")
		dir = ($"../../Kyle".global_position-global_position).normalized()
		velocity = dir*speed
		move_and_slide()

	elif mode == "RETREAT":
		$AnimationPlayer.play("Retreat")
		dir = (global_position-$"../../Kyle".global_position).normalized()
		if role:
			velocity = dir*speed/5
			move_and_slide()
		
	elif mode == "CELEBRATE":
		$AnimationPlayer.play("Celebrate")

	
	


func turn_away():
	mode = "RETREAT"
	scale.x = -1
	set_collision_layer_value(1, false)
	set_collision_mask_value(1, false)
func move():
	velocity = dir*speed
	move_and_slide()
