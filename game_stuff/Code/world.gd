extends Node2D

var the_role = preload("res://game_stuff/Scenes/role.tscn")
var available_roles: Array = ["Artist1", "Artist2", "Musician1", "Musician2", "Programmer1", "Programmer2", "Playtester1", "Playtester2"]

var available_stars: Array = [4, 3, 3, 2, 2, 1, 1, 0, 0, 0]

var number_of_guys_on_map: int = 0

var max_guys = 20

var number_of_celebraters = 0

func _ready() -> void:
	randomize()
	$Game_Time.start()
	
		
func _physics_process(delta: float) -> void:
	$Time_left.text = "%d" % $Game_Time.time_left


func _on_on_the_team_body_entered(body: Node2D) -> void:
	body.mode = "CELEBRATE"
	for i in range(randi_range(10,30)): body.move()
	body.set_collision_layer_value(2, false)
	number_of_guys_on_map -= 1
	number_of_celebraters += 1

func spawn_role():
	if available_roles.size() == 0: available_roles = ["Artist1", "Artist2", "Musician1", "Musician2", "Programmer1", "Programmer2", "Playtester1", "Playtester2"]
	if available_stars.size() == 0: available_stars = [4, 3, 3, 2, 2, 1, 1, 0, randi_range(0,4), randi_range(0,4)]


	var random_role = available_roles[randi() % available_roles.size()]
	
	var random_star = available_stars[randi() % available_stars.size()]
	
	var new_role = the_role.instantiate() #ADD WORLD. maybe not world.
	
	new_role.type_of_person = random_role
	available_roles.erase(random_role)
	
	new_role.stars = random_star
	available_stars.erase(random_star)
	
	var rand_spawn_place = randi_range(1,2)
	if rand_spawn_place == 1:
		new_role.global_position = Vector2(1100, randi_range(700, -700))
	elif rand_spawn_place == 2:
		new_role.global_position = Vector2(-1100, randi_range(700, -700))
		new_role.scale.x = -1

	#new_role.global_position.x += randi_range(100,-100)
	$Spawner.add_child(new_role)
	number_of_guys_on_map += 1



func _on_game_time_timeout() -> void:
	pass # Replace with function body.


func _on_spawn_timer_timeout() -> void:
	if number_of_guys_on_map < max_guys: spawn_role()
	#var repeat = 0
	#while repeat <4:
		#if number_of_guys_on_map < max_guys:
			#spawn_role()
		#repeat +=1
	$Spawn_Timer.wait_time = randi_range(10,30)/10
	$Spawn_Timer.start()
