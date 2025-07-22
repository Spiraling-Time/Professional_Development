extends "res://game_stuff/Code/fan_and_role.gd"

func _ready() -> void:
	type_of_person = "Assassin"
	role = false
	mode = "RUN"
	max_speed = randi_range(70,100)
	speed = max_speed
	dir = Vector2.ZERO

	var person = randi_range(1,8)
	var theshape = RectangleShape2D.new()
	if person == 1:
		$Sprite2D.texture = load("res://game_stuff/Assets/Characters/Artist 1 sprite sheet.png")
		theshape.size = Vector2(55.0, 114.0)
		$CollisionShape2D.shape = theshape
		$CollisionShape2D.position = Vector2(4.5, 8.0)
	elif person == 2:
		$Sprite2D.texture = load("res://game_stuff/Assets/Characters/Artist 2 sprite sheet.png")
		theshape.size = Vector2(72.0, 108.0)
		$CollisionShape2D.shape = theshape
		$CollisionShape2D.position = Vector2(-2.0, 17.0)
	elif person == 3:
		$Sprite2D.texture = load("res://game_stuff/Assets/Characters/Musician 1 Sprite Sheet.png")
		theshape.size = Vector2(66.0, 119.0)
		$CollisionShape2D.shape = theshape
		$CollisionShape2D.position = Vector2(0.0, 3.5)
	elif person == 4:
		$Sprite2D.texture = load("res://game_stuff/Assets/Characters/Musician 2 Sprite Sheet.png")
		theshape.size = Vector2(55.0, 114.0)
		$CollisionShape2D.shape = theshape
		$CollisionShape2D.position = Vector2(-0.5, 4.0)
	elif person == 5:
		$Sprite2D.texture = load("res://game_stuff/Assets/Characters/Programmer 1 Sprite Sheet.png")
		theshape.size = Vector2(51.0, 103.0)
		$CollisionShape2D.shape = theshape
		$CollisionShape2D.position = Vector2(0.5, 9.5)	
	elif person == 6:
		$Sprite2D.texture = load("res://game_stuff/Assets/Characters/Programmer 2 Sprite Sheet.png")
		theshape.size = Vector2(54.0, 108.0)
		$CollisionShape2D.shape = theshape
		$CollisionShape2D.position = Vector2(-1.0, 16.0)	
	elif person == 7:
		$Sprite2D.texture = load("res://game_stuff/Assets/Characters/Playtester 1 Sprite Sheet.png")
		theshape.size = Vector2(51.0, 103.0)
		$CollisionShape2D.shape = theshape
		$CollisionShape2D.position = Vector2(-4.5, 21.5)	
	elif person == 8:
		$Sprite2D.texture = load("res://game_stuff/Assets/Characters/Playtester 2 Sprite Sheet.png")
		theshape.size = Vector2(52.0, 135.0)
		$CollisionShape2D.shape = theshape
		$CollisionShape2D.position = Vector2(0.0, 12.5)	
	
	
	distance_before_chill = randi_range(300,600)
