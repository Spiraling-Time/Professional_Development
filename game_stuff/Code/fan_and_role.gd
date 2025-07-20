extends CharacterBody2D

var type_of_person
var role
var mode
var max_speed
var speed
var dir

var job

var stars = 5

var base_Z_Index = 0

var distance_before_chill = randi_range(800,100)

var ready_to_run: bool = true

func _ready() -> void:
	set_z_index(base_Z_Index)

func _physics_process(delta: float) -> void:
	Z_Indexing()
	if self in $"../../Wave".get_overlapping_bodies():
		if mode == "RETREAT":
			set_collision_layer_value(1, true)
			set_collision_mask_value(1, true)
			if scale.x == -1: scale.x = 1
			elif scale.x == 1: scale.x = -1
			mode = "MOVE"

		elif mode == "MOVE" and ready_to_run:
			mode = "RUN"

	if mode == "MOVE":
		#if type_of_person = "FAN1"
		$AnimationPlayer.play("Move")
		if global_position.distance_to($"../../Kyle".global_position) >distance_before_chill:
			dir = ($"../../Kyle".global_position-global_position).normalized()
		else:
			dir = ($"../../Kyle".global_position-global_position).normalized()
			dir.y = 0
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

	
	if role:
		if self in $"../../Cursor".get_overlapping_bodies():
			$Stars.visible = true
			$Icon.visible = true
		else:
			$Stars.visible = false
			$Icon.visible = false
	if global_position.y < -715.0 or global_position.y > 715.0 or global_position.x < -1260.0 or global_position.x > 1260.0:
		delete_self()

func turn_away():
	mode = "RETREAT"
	scale.x = -1
	set_collision_layer_value(1, false)
	set_collision_mask_value(1, false)
	ready_to_run = false
func move():
	velocity = dir*speed
	move_and_slide()

func Z_Indexing():
	set_z_index(global_position.y + base_Z_Index)

func delete_self():
	print(global_position)
	$"../..".number_of_guys_on_map -=1
	queue_free()

func get_ready_to_run():
	ready_to_run = true
