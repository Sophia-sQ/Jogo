extends CharacterBody2D

var anda=false
const SPEED = 100.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	animated_sprite.play("idle_frente")

func _physics_process(delta: float) -> void:
	#if not is_on_floor():
		#velocity += get_gravity() * delta

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
	

	# Vetor de direção
	var direction = Vector2(movex, movey)

	# Normaliza para evitar diagonais mais rápidas
	if direction != Vector2.ZERO:
		direction = direction.normalized()
		
	# Aplica movimento
	velocity = direction * SPEED
	move_and_slide()
