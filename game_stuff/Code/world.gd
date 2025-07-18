extends Node2D

var detect_radius = 190.0
var the_role = preload("res://game_stuff/Scenes/role.tscn")
var available_roles: Array = ["Artist1", "Artist2", "Musician1", "Musician2", "Programmer1", "Programmer2", "Playtester1", "Playtester2"]

var number_of_guys_on_map: int = 0

func _ready() -> void:
	randomize()
	
		

func _process(delta: float) -> void:
	if number_of_guys_on_map < 16: spawn_role()

func _on_on_the_team_body_entered(body: Node2D) -> void:
	body.mode = "CELEBRATE"
	body.set_collision_layer_value(1, false)
	body.set_collision_layer_value(2, false)
	body.set_collision_mask_value(1, false)
	detect_radius -= 10
	var theshape = CircleShape2D.new()
	theshape.radius = detect_radius
	$OnTheTeam/CollisionShape2D.shape = theshape

func spawn_role():
	var random_role = available_roles[randi() % available_roles.size()]
	var new_role = the_role.instantiate() #ADD WORLD. maybe not world.
	new_role.type_of_person = random_role
	available_roles.erase(random_role)
	if available_roles.size() == 0: available_roles = ["Artist1", "Artist2", "Musician1", "Musician2", "Programmer1", "Programmer2", "Playtester1", "Playtester2"]
	var rand_spawn_place = randi_range(1,2)
	if rand_spawn_place == 1:
		new_role.position = Vector2(1100, randi_range(1100, -1100))
	elif rand_spawn_place == 2:
		new_role.position = Vector2(-1100, randi_range(1100, -1100))
		new_role.scale.x = -1

	new_role.position.x += randi_range(100,-100)
	$Spawner.add_child(new_role)
	number_of_guys_on_map += 1
