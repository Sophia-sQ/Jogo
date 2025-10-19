extends CharacterBody2D

var V = 3.3

@onready var timer_guarda: Timer = $Timer_guarda
@onready var plu: CharacterBody2D = $"../pluto_correndo"
@onready var gua: CharacterBody2D = $"."
@onready var cam: Camera2D = $"../pluto_correndo/Camera2D"

func _ready() -> void:
	Gerenciador.Sg.connect(Callable(self, "_on_sinal_guarda"))

func _on_sinal_guarda():
	timer_guarda.start()
	V = 0.5

func _physics_process(delta: float) -> void:
	position.x += V
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	
	if position.x <= cam.position.x-144:
		if plu.position.x <= cam.position.x:
			V = 10 
		else:
			V = 100
	 
	move_and_slide()



func _on_timer_guarda_timeout() -> void:
	V = 3.3


func _on_plu_mrt_body_entered(body: Node2D) -> void:
	print("Morreu")
	get_tree().reload_current_scene()
