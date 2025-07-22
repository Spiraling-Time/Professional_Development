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

var distance_before_chill = randi_range(800,1000)

var ready_to_run: bool = true

var locked_in: bool = false

var SUPRISE: bool = false

func _ready() -> void:
	set_z_index(base_Z_Index)


func _physics_process(delta: float) -> void:
	if ! role:
		if type_of_person == "FAN1":
			speed -=1
			if speed <= 100: speed = randi_range(145,155)
		elif type_of_person == "Assassin":
			if global_position.distance_to($"../../Kyle".global_position) < distance_before_chill:
				$Sprite2D.texture = load("res://game_stuff/Assets/Characters/Assassin Sprite Sheet.png")
				var theshape = RectangleShape2D.new()
				theshape.size = Vector2(65.0, 123.0)
				$CollisionShape2D.shape = theshape
				$CollisionShape2D.position = Vector2(7.5, 17.5)
		
		
	Z_Indexing()
	if self in $"../../Wave".get_overlapping_bodies():
		if mode == "RETREAT":

			turn_around()
			mode = "MOVE"

		elif mode == "MOVE" and ready_to_run:
			mode = "RUN"

	if mode == "MOVE":
		#if type_of_person = "FAN1"
		$AnimationPlayer.play("Move")
		if !locked_in:
			if global_position.distance_to($"../../Kyle".global_position) >distance_before_chill:
				dir = ($"../../Kyle".global_position-global_position).normalized()
			elif dir.x <5 and dir.x >-5:
				locked_in = true
				dir.x = ($"../../Kyle".global_position-global_position).normalized().x


		else: dir.y = 0
	
		velocity = dir*speed
		move_and_slide()

	elif mode == "RUN":
		locked_in = false
		if !role:
			if type_of_person == "FAN1": speed += 2
			else: speed += .1
		#if type_of_person = "FAN1"
		$AnimationPlayer.play("Run")
		dir = ($"../../Kyle".global_position-global_position).normalized()
		velocity = dir*speed*2
		move_and_slide()

	elif mode == "RETREAT":
		$AnimationPlayer.play("Retreat")
		dir = (global_position-$"../../Kyle".global_position).normalized()
		if !type_of_person == "Assassin": velocity = dir*speed/5
		else: velocity = dir*speed/2
		move_and_slide()
		
	elif mode == "CELEBRATE":

		$AnimationPlayer.play("Celebrate")

	
	
	if self in $"../../Cursor".get_overlapping_bodies():
		if type_of_person != "Assassin":
			$Stars.visible = true
			if role: $Icon.visible = true
	else:
		if type_of_person != "Assassin":
			$Stars.visible = false
			if role: $Icon.visible = false

	
	if global_position.y < -715.0 or global_position.y > 715.0 or global_position.x < -1260.0 or global_position.x > 1260.0:
		delete_self()

func turn_away():
	mode = "RETREAT"
	turn_around()

	ready_to_run = false
func move():
	velocity = dir*speed
	move_and_slide()

func Z_Indexing():
	set_z_index(global_position.y + base_Z_Index)

func delete_self():
	$"../..".number_of_guys_on_map -=1
	queue_free()

func get_ready_to_run():
	ready_to_run = true
	locked_in = false

func turn_around():
	if scale.x == 1: scale.x = -1
	else: scale.x = 1

	
	
func assassinate():
	$"../..".assassinated = true
	$"../..".end_of_round()
