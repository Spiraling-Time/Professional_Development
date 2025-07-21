extends Node2D

var save_path_normal_mode = "user://variable.save_normal"

var saved_normal_final_score = 0


var game_mode = "NORMAL"

var star_free_to_spawn = preload("res://game_stuff/Scenes/star_free_to_spawn.tscn")

var the_role = preload("res://game_stuff/Scenes/role.tscn")

#var fan1 = preload()

var available_roles: Array = ["Artist1", "Artist2", "Musician1", "Musician2", "Programmer1", "Programmer2", "Playtester1", "Playtester2"]

var available_stars: Array = [4, 3, 3, 2, 2, 1, 1, 0, 0, 0]

var number_of_guys_on_map: int = 0

var max_guys = 20

var spaces = 10

var number_of_celebraters = 0

var celebraters: Array = []

var starSCORE = 0
var balancedSCORE = 0
var timeleftSCORE = 0
var spaceleftSCORE = 0
var finalSCORE = 0

func _ready() -> void:
	randomize()
	#save_normal()
	load_data_normal()
	$Game_Time.start()
	
		
func _physics_process(delta: float) -> void:
	$Time_left.text = "%d" % $Game_Time.time_left
	if spaces - number_of_celebraters <= 0:
		end_of_round()

func _on_on_the_team_body_entered(body: Node2D) -> void:
	body.mode = "CELEBRATE"
	for i in range(randi_range(10,30)): body.move()
	body.set_collision_layer_value(2, false)
	number_of_guys_on_map -= 1
	number_of_celebraters += 1
	starSCORE += 5-body.stars
	celebraters.append(body)

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
		new_role.global_position = Vector2(1100, randi_range(700, -400))
	elif rand_spawn_place == 2:
		new_role.global_position = Vector2(-1100, randi_range(700, -400))
		new_role.scale.x = -1

	#new_role.global_position.x += randi_range(100,-100)
	$Spawner.add_child(new_role)
	number_of_guys_on_map += 1



func _on_game_time_timeout() -> void:
	end_of_round()


func _on_spawn_timer_timeout() -> void:
	if number_of_guys_on_map < max_guys: spawn_role()
	$Spawn_Timer.wait_time = randi_range(10,30)/10
	$Spawn_Timer.start()

func end_of_round():
	get_tree().paused = true
	$"Final Score".visible = true
	$Time_left.visible = false
	var arts = 0
	var musis = 0
	var progs = 0
	var plays = 0
	if game_mode == "NORMAL":
		$balancedSCORE.visible = true
		$timeleftSCORE.visible = true
		$spaceleftSCORE.visible = true
		$FINAL_SCORE.visible = true
		$HIGH_SCORE.visible= true
		
		for bodies in celebraters:
			if bodies.job == "Artist":
				arts += 1
			elif bodies.job == "Musician":
				musis += 1
			elif bodies.job == "Programmer":
				progs += 1
			elif bodies.job == "Playtester":
				plays += 1
		if arts >= 2 and musis >= 2 and progs >= 2 and plays >= 2:
			balancedSCORE = 5
		else:
			balancedSCORE = 0
		timeleftSCORE = $Game_Time.time_left
		if timeleftSCORE > 50: timeleftSCORE = 5
		elif timeleftSCORE > 40: timeleftSCORE = 4
		elif timeleftSCORE > 30: timeleftSCORE = 3
		elif timeleftSCORE > 20: timeleftSCORE = 2
		elif timeleftSCORE > 10: timeleftSCORE = 1
		elif timeleftSCORE > 0: timeleftSCORE = 0

		spaceleftSCORE = spaces - number_of_celebraters
		if spaceleftSCORE == 2: spaceleftSCORE = 5
		elif spaceleftSCORE == 1: spaceleftSCORE = 3
		else: spaceleftSCORE = 0


		if balancedSCORE == 5: $balancedSCORE.frame = 0
		else: $balancedSCORE.frame = 5
		
		if timeleftSCORE == 5: $timeleftSCORE.frame = 0
		elif timeleftSCORE == 4: $timeleftSCORE.frame = 1
		elif timeleftSCORE == 3: $timeleftSCORE.frame = 2
		elif timeleftSCORE == 2: $timeleftSCORE.frame = 3
		elif timeleftSCORE == 1: $timeleftSCORE.frame = 4
		elif timeleftSCORE == 0: $timeleftSCORE.frame = 5
		
		if spaceleftSCORE == 5: $spaceleftSCORE.frame = 0
		elif spaceleftSCORE == 3: $spaceleftSCORE.frame = 3
		else: $spaceleftSCORE.frame = 5
		
		for i in range(starSCORE):
			var newstar = star_free_to_spawn.instantiate()
			newstar.position	 = Vector2(-216.0 + 10*i, -30.0)
			self.add_child(newstar)
		
		finalSCORE = starSCORE + balancedSCORE + timeleftSCORE + spaceleftSCORE
		if finalSCORE > saved_normal_final_score:
			save_normal()
			load_data_normal()
			$NEW_HIGH_SCORE.visible = true
		for i in range(finalSCORE):
			var newstar = star_free_to_spawn.instantiate()
			newstar.position	 = Vector2(-102.0 + 10*i, 99.0)
			self.add_child(newstar)
		
		$FINAL_SCORE.text = "%d" % finalSCORE
		
		for i in range(saved_normal_final_score):
			var newstar = star_free_to_spawn.instantiate()
			newstar.position	 = Vector2(-102.0 + 10*i, 165.0)
			self.add_child(newstar)
		$HIGH_SCORE.text = "%d" % saved_normal_final_score
				
		$End_round.visible = true







#func save_everything():
	#save_normal()
#
#
#func load_everything():
	#load_data_normal()


func save_normal():
	var file = FileAccess.open(save_path_normal_mode, FileAccess.WRITE)
	file.store_var(finalSCORE)


func load_data_normal():
	if FileAccess.file_exists(save_path_normal_mode):
		var file = FileAccess.open(save_path_normal_mode, FileAccess.READ)
		saved_normal_final_score = file.get_var()
