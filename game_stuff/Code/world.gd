extends Node2D

var detect_radius = 190.0

func _on_on_the_team_body_entered(body: Node2D) -> void:
	body.mode = "CELEBRATE"
	body.set_collision_layer_value(1, false)
	body.set_collision_layer_value(2, false)
	body.set_collision_mask_value(1, false)
	detect_radius -= 10
	var theshape = CircleShape2D.new()
	theshape.radius = detect_radius
	$OnTheTeam/CollisionShape2D.shape = theshape
