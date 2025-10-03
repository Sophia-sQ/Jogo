extends  Area2D

@onready var sprite: Sprite2D = $"../Sprite2D"
@onready var text_box: MarginContainer = $"../Sprite2D/text_box"
@onready var pluto_em_pe: CharacterBody2D = $"../pluto_em_pe"
var once=false

func _ready() -> void:
	text_box.hide()

func _on_body_entered(body: Node2D) -> void:
	if body == pluto_em_pe and once ==false:
		once=true
		Dialogos.dialogo(sprite.global_position, sprite.falas)
