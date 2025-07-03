extends Node2D

var speed_left = .07
var speed_right = .07
var prev_vector_x: bool = true



func _physics_process(delta: float) -> void:
	if Input.get_action_strength("left") >= .1:
		rotation -= speed_left
		if rotation <= -360: rotation = 0
		$BodyGuard1.rotation += speed_left
		if $BodyGuard1.rotation >= 360: $BodyGuard1.rotation = 0
		$BodyGuard2.rotation += speed_left
		if $BodyGuard2.rotation >= 360: $BodyGuard2.rotation = 0
		var body_guard1_rotation = (global_position - $BodyGuard1.global_position).normalized()
		if body_guard1_rotation.x > 0 and prev_vector_x == false or (body_guard1_rotation.x < 0 and prev_vector_x == true):
			$BodyGuard1.scale.x = $BodyGuard1.scale.x*-1
			$BodyGuard2.scale.x = $BodyGuard2.scale.x*-1
			#print("swap")
			#print((global_position - body_guard1_rotation))		
		if body_guard1_rotation.x > 0: prev_vector_x = true
		else: prev_vector_x = false

		
			#$BodyGuard2.scale.x = $BodyGuard2.scale.x*-1
			#print("swap")
		#print((global_position - $BodyGuard1.global_position).normalized())
		
	elif Input.get_action_strength("right") >= .1:
		rotation += speed_right
		if rotation >= 360: rotation = 0
		$BodyGuard1.rotation -= speed_right
		if $BodyGuard1.rotation <= -360: $BodyGuard1.rotation = 0
		$BodyGuard2.rotation -= speed_right
		if $BodyGuard2.rotation <= -360: $BodyGuard2.rotation = 0
		var body_guard1_rotation = (global_position - $BodyGuard1.global_position).normalized()
		if body_guard1_rotation.x > 0 and prev_vector_x == false or (body_guard1_rotation.x < 0 and prev_vector_x == true):
			$BodyGuard1.scale.x = $BodyGuard1.scale.x*-1
			$BodyGuard2.scale.x = $BodyGuard2.scale.x*-1
			#print("swap")
			#print((global_position - body_guard1_rotation))		
		if body_guard1_rotation.x > 0: prev_vector_x = true
		else: prev_vector_x = false
