extends Node2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var asteroide: Node2D = $"."
@onready var animated_sprite2: AnimatedSprite2D = get_node("/root/Cena1/GameManager/AnimatedSprite2D")
var direction=-1
const SPEED = 200
var grav = 100
var explodiu = false
@onready var audio_stream_player: AudioStreamPlayer2D = $AudioStreamPlayer2D
@onready var killzone_asteroide: Area2D = $Killzone_asteroide


func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if killzone_asteroide.ativo==true:
		position.y += 0
	else:
		position.y += grav * delta
