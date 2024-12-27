extends CharacterBody2D


@onready var pov_direction = $"."
@export var speed: float = 100.0
var direction: float = 1.0

func _physics_process(delta: float) -> void:
	velocity.x = direction * speed
	move_and_slide()

func _on_wall_trigger_body_entered(body: Node2D) -> void:
	direction = -direction
	# Отразить спрайт или другой визуальный элемент
	pov_direction.scale.x = -pov_direction.scale.x
