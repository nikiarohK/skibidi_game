extends CharacterBody2D


var SPEED = 300.0
const JUMP_VELOCITY = -400.0
var direction := 1
var flag_jump = true

@onready var anim = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Гравитация
	if not is_on_floor():
		velocity += get_gravity() * delta
		if flag_jump:
			anim.play("Jump")
		flag_jump = false
	else:
		anim.play("Idle")
		velocity.x = 0
	# Смотрим, что было нажато и выбираем направление
	if Input.is_action_just_pressed("move_right"):
		SPEED = 300.0
		anim.flip_h = false
	if Input.is_action_just_pressed("move_left"):
		SPEED = -300.0
		anim.flip_h = true
	# Управления прыжка
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		flag_jump = true
		velocity.y = JUMP_VELOCITY
		velocity.x = 1 * SPEED
	elif not Input.is_action_pressed("ui_accept"):
		velocity.y = -JUMP_VELOCITY
		velocity.x = 0


	move_and_slide()
