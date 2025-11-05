extends Control

@onready var camera = $"../../../pluto_em_pe/Camera2D"
@onready var pause: Control = $"../../Node2D2/CanvasLayer/pause"

func _ready() -> void:
	visible=false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
##menu de perdeu
func _on_sair_pressed() -> void:
	get_tree().quit()

func _on_reiniciar_pressed() -> void:
	get_tree().paused=false
	get_tree().reload_current_scene()
	
func _perda():
	visible=true
	get_tree().paused=true
