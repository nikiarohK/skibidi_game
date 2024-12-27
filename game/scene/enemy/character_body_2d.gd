extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var direction = 1
var walk = true
func _physics_process(delta: float) -> void:

	if not is_on_floor():
		velocity += get_gravity() * delta
	if walk:
		velocity.x = direction * SPEED
	else:
		direction = -direction
		

	move_and_slide()


func _on_wallcheck_body_entered(body: Node2D) -> void:
	walk = false


func _on_floorcheck_body_entered(body: Node2D) -> void:
	walk = true



func _on_floorcheck_body_exited(body: Node2D) -> void:
	walk = false
