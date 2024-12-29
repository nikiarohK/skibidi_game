extends Node2D

@onready var sound_death = $AudioStreamPlayer


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		get_tree().reload_current_scene()
