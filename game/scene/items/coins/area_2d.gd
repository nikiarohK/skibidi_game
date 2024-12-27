extends Area2D


@onready var coin = $"../AudioStreamPlayer"

# Called when the node enters the scene tree for the first time.
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		coin.play()
		queue_free()
