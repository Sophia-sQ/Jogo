extends Area2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $"../AudioStreamPlayer2D"
@onready var plumbum: CharacterBody2D = $"../plumbum"
var corpo:=false
@onready var alarme: CanvasLayer = $"../alarme"
@onready var color_rect: ColorRect = $"../ColorRect"
var ativo=false
@onready var animated_sprite_2d: AnimatedSprite2D = $"../plumbum/AnimatedSprite2D"

func _ready() -> void:
	Transição.fim_transição.connect(Callable(self, "_on_fim_transição"))

func _on_body_entered(body: Node2D) -> void:
	if body==plumbum:
		print("corpo dentro")
		corpo=true
		
func _unhandled_input(event: InputEvent) -> void:
	##ativa alarme e guarda aparece
	if event.is_action_pressed("space"):
		animated_sprite_2d.play("idle_costas")
		print("chumbo recebido")
		Gerenciador.add_item.emit("chumbo")
		alarme._alarme()
		ativo=true
		await get_tree().create_timer(8).timeout
		print("pego")
		audio_stream_player_2d.play()
		color_rect.visible=true
		await get_tree().create_timer(2).timeout
		Transição._transição()
		
func _on_fim_transição():
	get_tree().change_scene_to_file("res://scenes/cena_3/cena_3.tscn")
