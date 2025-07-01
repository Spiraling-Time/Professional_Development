extends CharacterBody2D

var offset = Vector2(0, -300)

func _physics_process(delta: float) -> void:
	if Input.get_action_strength("left") >= 1:
		if $"../BodyGuard".position.y <= 0: offset += Vector2(-10,10)
		elif $"../BodyGuard".position.y >= 0: offset += Vector2(-10,-10)

	if Input.get_action_strength("right") >= 1:
		if $"../BodyGuard".position.y <= 0: offset += Vector2(10,10)
		elif $"../BodyGuard".position.y >= 0: offset += Vector2(10,-10)
