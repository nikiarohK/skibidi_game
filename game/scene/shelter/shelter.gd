extends Area2D


func _on_body_entered(body: Node2D) -> void:
	body.remove_from_group("player")


func _on_body_exited(body: Node2D) -> void:
	body.add_to_group("player")
