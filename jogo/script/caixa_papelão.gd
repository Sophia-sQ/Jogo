extends Area2D

@onready var p: CharacterBody2D = $"../../pluto_correndo"
@onready var g: CharacterBody2D = $"../../guarda_correndo"
@onready var Atr: Timer = $"../Timer_ATRITO"
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func _on_body_entered(body: Node2D) -> void:
	if body == g:
		Gerenciador.Sg.emit()
		animated_sprite_2d.play("atrito")
	if body == p:
		Gerenciador.Sp.emit()
		animated_sprite_2d.play("atrito")  

func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()
