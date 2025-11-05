extends CharacterBody2D
var entrada:=true
var anda=false
var saida=false
const SPEED = 100.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var cena_2: Node2D = $".."


func _ready() -> void:
	animated_sprite.play("anda_esquerda")
	#Dialogos.inicio_dialogo.connect(Callable(self, "_on_inicio_dialogo"))
	#Dialogos.fim_dialogo.connect(Callable(self, "_on_fim_dialogo"))
	Transição.fim_transição.connect(Callable(self, "_on_fim_transição"))
func _physics_process(delta: float) -> void:
	if get_tree().paused==true:
		animated_sprite.stop()
	if entrada==false and position.x<=-1730 and cena_2.permitido==true:
		saida=true
		
	if entrada==true:
		position.x-=65*delta
		if position.x<=244:
			animated_sprite.play("idle_esquerda")
			entrada=false
	elif saida==true and cena_2.permitido==true:
		animated_sprite.play("anda_esquerda")
		position.x-=65*delta
		if position.y<105:
			position.y+=65*delta
		elif position.y>109:
			position.y-=65*delta
		if position.x<=-1870:
			Transição._transição()
	elif entrada==false and saida==false:
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
		
		var direction = Vector2(movex, movey)

		#if direction != Vector2.ZERO:
			#direction = direction.normalized()

		velocity = direction * SPEED
		move_and_slide()

func _on_fim_transição():
	get_tree().change_scene_to_file("res://scenes/cena_3/cena_3_1.tscn")


#func _on_inicio_dialogo():
	#trava=true
	#animated_sprite.play("idle_esquerda")
	#
#func _on_fim_dialogo():
	#trava=false
	
