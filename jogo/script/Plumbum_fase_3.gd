extends CharacterBody2D
var entrada:=true
const SPEED = 100.0
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var pega_chumbo: Area2D = $"../pega_chumbo"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	animated_sprite.play("anda_costas")

func _physics_process(delta: float) -> void:
	if entrada==true:
		position.y-=65*delta
		if position.y<=167:
			animated_sprite_2d.play("idle_costas")
			entrada=false
	elif entrada==false and pega_chumbo.ativo==false:
		var movex := 0
		var movey := 0
		var direction = Vector2(movex, movey)
		if Input.is_action_pressed("up"):
			if get_tree().paused==true:
				animated_sprite.play("idle_costas")
			else:
				animated_sprite.play("anda_costas")
			#movey=-1
			position.y+=-1
		elif Input.is_action_pressed("down"):
			if get_tree().paused==true:
				animated_sprite.play("idle_frente")
			else:
				animated_sprite.play("anda_frente")
			position.y+=1
			#movey=1
		elif Input.is_action_just_released("up") or get_tree().paused==true:
			animated_sprite.play("idle_costas")
		elif Input.is_action_just_released("down"):
			animated_sprite.play("idle_frente")
		
		
		move_and_slide()
