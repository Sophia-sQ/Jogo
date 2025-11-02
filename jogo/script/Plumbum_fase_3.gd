extends CharacterBody2D


const SPEED = 95.0
const JUMP_VELOCITY = -75.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D2


func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	var directiony := Input.get_axis("ui_up", "ui_down")
	if directiony:
		velocity.y = directiony * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
		
	var movex := 0
	var movey := 0
	if Input.is_action_pressed("left"):
		animated_sprite.play("anda_esquerda")
		movex=-1
	elif Input.is_action_pressed("right"):
		animated_sprite.play("anda_direita")
		movex=1
	elif Input.is_action_pressed("up"):
		animated_sprite.play("anda_costas")
		movey=-1
	elif Input.is_action_pressed("down"):
		animated_sprite.play("anda_frente")
		movey=1
	elif Input.is_action_just_released("left"):
		animated_sprite.play("idle_esquerda")
	elif Input.is_action_just_released("right"):
		animated_sprite.play("idle_direita")
	elif Input.is_action_just_released("up"):
		animated_sprite.play("idle_costas")
	elif Input.is_action_just_released("down"):
		animated_sprite.play("idle_frente")

	move_and_slide()
