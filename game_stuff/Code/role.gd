extends "res://game_stuff/Code/fan_and_role.gd"

func _ready() -> void:
	var person = randi_range(1,8)
	var theshape = RectangleShape2D.new()
	if person == 1:
		type_of_person = "Artist1"
		$Sprite2D.texture = load("res://game_stuff/Assets/Characters/Artist 1 sprite sheet.png")
		theshape.size = Vector2(55.0, 114.0)
		$CollisionShape2D.shape = theshape
		$CollisionShape2D.position = Vector2(4.5, 8.0)
		job = "Artist"
	elif person == 2:
		type_of_person = "Artist2"
		$Sprite2D.texture = load("res://game_stuff/Assets/Characters/Artist 2 sprite sheet.png")
		theshape.size = Vector2(72.0, 108.0)
		$CollisionShape2D.shape = theshape
		$CollisionShape2D.position = Vector2(-2.0, 17.0)
		job = "Artist"
	elif person == 3:
		type_of_person = "Musician1"
		$Sprite2D.texture = load("res://game_stuff/Assets/Characters/Musician 1 Sprite Sheet.png")
		theshape.size = Vector2(66.0, 119.0)
		$CollisionShape2D.shape = theshape
		$CollisionShape2D.position = Vector2(0.0, 3.5)
		job = "Musician"
	elif person == 4:
		type_of_person = "Musician2"
		$Sprite2D.texture = load("res://game_stuff/Assets/Characters/Musician 2 Sprite Sheet.png")
		theshape.size = Vector2(55.0, 114.0)
		$CollisionShape2D.shape = theshape
		$CollisionShape2D.position = Vector2(-0.5, 4.0)
		job = "Musician"
	elif person == 5:
		type_of_person = "Programmer1"
		$Sprite2D.texture = load("res://game_stuff/Assets/Characters/Programmer 1 Sprite Sheet.png")
		theshape.size = Vector2(51.0, 103.0)
		$CollisionShape2D.shape = theshape
		$CollisionShape2D.position = Vector2(0.5, 9.5)	
		job = "Programmer"
	elif person == 6:
		type_of_person = "Programmer2"
		$Sprite2D.texture = load("res://game_stuff/Assets/Characters/Programmer 2 Sprite Sheet.png")
		theshape.size = Vector2(54.0, 108.0)
		$CollisionShape2D.shape = theshape
		$CollisionShape2D.position = Vector2(-1.0, 16.0)	
		job = "Programmer"
	elif person == 7:
		type_of_person = "Playtester1"
		$Sprite2D.texture = load("res://game_stuff/Assets/Characters/Playtester 1 Sprite Sheet.png")
		theshape.size = Vector2(51.0, 103.0)
		$CollisionShape2D.shape = theshape
		$CollisionShape2D.position = Vector2(-4.5, 21.5)	
		job = "Playtester"
	elif person == 8:
		type_of_person = "Playtester2"
		$Sprite2D.texture = load("res://game_stuff/Assets/Characters/Playtester 2 Sprite Sheet.png")
		theshape.size = Vector2(52.0, 135.0)
		$CollisionShape2D.shape = theshape
		$CollisionShape2D.position = Vector2(0.0, 12.5)	
		job = "Playtester"
	stars = randi_range(0,4)
	$Stars.frame = stars
	$Stars.position.y += theshape.size.y-260
	$Icon.position.y += theshape.size.y-300
	if job == "Artist": $Icon.frame = 0
	elif job == "Musician": $Icon.frame = 1
	elif job == "Programmer": $Icon.frame = 2
	elif job == "Playtester": $Icon.frame = 3

	role = true
	mode = "MOVE"
	max_speed = randi_range(200,400)
	speed = max_speed
	dir = Vector2.ZERO
