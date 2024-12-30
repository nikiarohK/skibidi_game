extends CharacterBody2D

var SPEED = 200.0
const JUMP_VELOCITY = -350.0
var direction := 1
var flag_jump = true

@onready var anim = $AnimatedSprite2D
@onready var sound = $AudioStreamPlayer


func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	# Гравитация
	if not is_on_floor():
		if velocity.x == 0 and not flag_jump:
			velocity.x = SPEED
		velocity += get_gravity() * delta
		if flag_jump:
			anim.play("Jump")
		flag_jump = false
	else:
		anim.play("Idle")
		velocity.x = 0

	# Смотрим, что было нажато и выбираем направление
	if Input.is_action_just_pressed("move_right"):
		SPEED = abs(SPEED)
		anim.flip_h = false
	if Input.is_action_just_pressed("move_left"):
		SPEED = -abs(SPEED)
		anim.flip_h = true

	# Управления прыжка
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		sound.play()
		flag_jump = true
		velocity.y = JUMP_VELOCITY
		velocity.x = 1 * SPEED
	elif not Input.is_action_pressed("ui_accept"):
		velocity.y = -JUMP_VELOCITY
		velocity.x = 0
	move_and_slide()
