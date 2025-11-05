extends Area2D

@onready var asteroide: Node2D = $".."
@onready var animated_sprite: AnimatedSprite2D = $"../AnimatedSprite2D"
@onready var audio_stream_player: AudioStreamPlayer2D = $"../AudioStreamPlayer2D"
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"
@onready var pluto_nave: CharacterBody2D = get_node("/root/Cena1/pluto_nave")
@onready var timer: Timer = $Timer
var ativo
func _ready() -> void:
	Gerenciador.kill.connect(Callable(self, "_on_kill"))

func _on_body_entered(body: Node2D) -> void:
	if body == pluto_nave:
		##player toma dado e asteroide explode
		Gerenciador.kill.emit()
		print("Sinal 'kill' emitido para o gerenciador!")
		ativo=true
		asteroide.position.y +=0
		animation_player.play("sem_colisao")
		asteroide.rotation_degrees = -90
		animated_sprite.play("explosao")
		audio_stream_player.play()
		timer.start()

func _on_timer_timeout() -> void:
	asteroide.queue_free()
