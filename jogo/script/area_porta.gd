class_name Portas
extends Area2D

@onready var cena2: Node2D = $".."
@onready var tile_map: TileMap = $"../TileMap"
enum area {HORIZONTAL, VERTICAL}
@export var tipo: area
@export var deslocamento: int
@onready var pluto_em_pe: CharacterBody2D = $"../pluto_em_pe"

signal passou_porta
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void:
	if body!=tile_map and body==pluto_em_pe:
		if tipo==area.VERTICAL:
			if body.position.y>position.y: #corpo baxo
				body.position.y=position.y-deslocamento+60
			elif body.position.y<position.y: #corpo cima
				body.position.y=position.y+deslocamento
			body.position.x=position.x
			print(body.position.x)
		elif tipo==area.HORIZONTAL:
			if body.position.x<position.x:
				body.position.x=position.x+deslocamento
			elif body.position.x>position.x:
				body.position.x=position.x-deslocamento
			body.position.y=position.y
		Gerenciador.passou_porta.emit()
