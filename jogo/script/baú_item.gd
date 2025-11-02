extends Area2D
class_name baú
var corpo=false
@onready var pluto_em_pe: CharacterBody2D = $"../../../pluto_em_pe"
@export var num_bau: int
@export var item: String = "vazio"
@onready var tela_puzzle: Control = get_node("Tela_puzzle")
@onready var animated_sprite: AnimatedSprite2D = $Sprite2D


func _ready() -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body==pluto_em_pe:
		print("Corpo dentro (baú)")
		corpo=true
	if Input.is_action_just_pressed("space"):
		get_tree().paused=true
		print("pausar")

func _on_body_exited(body: Node2D) -> void:
	if body==pluto_em_pe:
		print("Corpo fora (baú)")
		corpo=false

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("space") and corpo==true and is_instance_valid(tela_puzzle)==true:
		print("ta aceitando")
		tela_puzzle._chamado(num_bau)
		get_tree().paused=true		


func _on_tela_puzzle_certo() -> void:
	print("bau aberto")
	animated_sprite.play("destrava")
	Gerenciador.add_item.emit(item)
