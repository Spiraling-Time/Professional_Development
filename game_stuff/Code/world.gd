extends Node2D


func _on_on_the_team_body_entered(body: Node2D) -> void:
	body.mode = "CELEBRATE"
	body.set_collision_layer_value(1, false)
	body.set_collision_layer_value(2, false)
	body.set_collision_mask_value(1, false)
