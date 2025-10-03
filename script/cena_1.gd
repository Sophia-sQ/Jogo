extends Node2D

@onready var troca_cena: Area2D = $troca_cena

func _ready() -> void:
	Gerenciador.troca_cena.connect(Callable(self, "_on_prox_cena"))
	
func _on_prox_cena():
	get_tree().change_scene_to_file("res://scenes/cena 2/cena2.tscn")
