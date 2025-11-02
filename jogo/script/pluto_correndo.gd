extends CharacterBody2D


var SPEED = 3
const JUMP_VELOCITY = -400.0

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var caixa_papelão: Area2D = $"../caixa_papelão"
@onready var timer: Timer = $"../caixas/Timer"
@onready var guarda_correndo: CharacterBody2D = $"../guarda_correndo"

func _ready() -> void:
	Gerenciador.Sp.connect(Callable(self, "_on_sinal_pluto"))

func _on_sinal_pluto():
	timer.start()
	SPEED = 1.25
	position.x += SPEED 

func _physics_process(delta: float) -> void:
	position.x += SPEED
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("space") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	if is_on_floor():
		animated_sprite_2d.play("default")
	else:
		animated_sprite_2d.play("parado")
	
	move_and_slide()

func _on_timer_timeout() -> void:
	SPEED = 3
	
	if position.x >= 3500 and position.x <=6999:
		SPEED = 3.1
	
	if position.x >= 7000 and position.x <=10499:
		SPEED = 3.2
	
	if position.x >= 10500 and position.x <= 13999:
		SPEED = 3.3
	
	if position.x >= 14000:
		SPEED = 3.4
