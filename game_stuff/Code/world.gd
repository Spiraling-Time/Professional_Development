extends Node2D


func _on_on_the_team_body_entered(body: Node2D) -> void:
	body.mode = "CELEBRATE"
	#body.position = Vector2(0,0)
