extends Node2D


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/levels/level one/level_one.tscn")


func _on_button_10_pressed() -> void:
	get_tree().change_scene_to_file("res://scene/levels/level1/test_level.tscn")
