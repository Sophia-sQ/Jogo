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
	V = 0.9
	
	if position.x >= 3500 and position.x <=6999:
			V = 1.05
	
	if position.x >= 7000 and position.x <=10499:
			V = 1.2
	
	if position.x >= 10500 and position.x <= 13999:
			V = 1.35
	
	if position.x >= 14000:
			V = 1.4

func _physics_process(delta: float) -> void:
	position.x += V
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	 
	move_and_slide()



func _on_timer_guarda_timeout() -> void:
	V = 4
	
	if position.x >= -200 and position.x <= 3499:
		V = 3.3

	if position.x >= 3500 and position.x <=6999:
		V = 3.35
	
	if position.x >= 7000 and position.x <=10499:
		V = 3.45
	
	if position.x >= 10500 and position.x <= 13999:
		V = 3.55
	
	if position.x >= 14000:
		V = 3.65
	


func _on_plu_mrt_body_entered(body: Node2D) -> void:
	print("Morreu")
	get_tree().reload_current_scene()
