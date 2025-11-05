extends Control

@onready var pause: Control = $"."
@onready var camera = $"../../../pluto_em_pe/Camera2D"
@onready var canvas_layer: CanvasLayer = get_parent()
@onready var perda: Control = $"../../../CanvasLayer/perda"
@onready var text_box: MarginContainer = $"../../medica/text_box"

func _ready() -> void:
	get_tree().paused=false
	visible=false
	canvas_layer.layer=128
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		get_tree().paused=true
		if get_tree().paused:
			visible = true
		else:
			visible = false
	#if get_tree().current_scene.scene_file_path == "res://scenes/cena_2/cena2.tscn":
		#position = camera.get_screen_center_position()
		#position.y-=75
		#position.x-=130
		
	if get_tree().current_scene.scene_file_path == "res://scenes/cena_3/cena_3.tscn":
		if perda.visible==true:
			visible=false
	#elif get_tree().current_scene.scene_file_path == "res://scenes/cena_1/cena1.tscn":
		#pass

func _on_jogar_pressed() -> void:
	get_tree().paused=false
	pause.visible=false

func _on_sair_pressed() -> void:
	get_tree().quit()
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		get_tree().paused=true


#func _on_reiniciar_pressed() -> void:
	#var atual = get_tree().current_scene
	#var path = "res://scenes/cena_2/cena2.tscn"
	#var caminho_atual: String = atual.scene_file_path
	#if caminho_atual == path:
		#text_box.queue_free()
#
		#get_tree().change_scene_to_file(path)
		#
	#else:
		#get_tree().reload_current_scene()
		
		
		
	#if atual==path:
		#get_tree().change_scene_to_file("res://scenes/cena_2/cena2.tscn")
	#else:
		#get_tree().reload_current_scene()
	

	#visible=false
