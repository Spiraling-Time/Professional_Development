extends "res://game_stuff/Code/fan_and_role.gd"

func _ready() -> void:
	var person = randi_range(1,8)
	if person == 1:
		type_of_person = "Artist1"
		var theshape = RectangleShape2D.new()
		theshape.size = Vector2(55.0, 114.0)
		$CollisionShape2D.shape = theshape
		$CollisionShape2D.position = Vector2(4.5, 8.0)

	role = true
	mode = "MOVE"
	max_speed = randi_range(200,400)
	speed = max_speed
	dir = Vector2.ZERO
	
