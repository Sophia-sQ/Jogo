extends Camera2D

@onready var tile_map_layer: TileMapLayer = $TileMapLayer
var change := false

func _ready() -> void:
	Geral._tocar_musica(2)

func _process(delta: float) -> void:
	if zoom.x < 6:
		zoom += Vector2(0.02, 0.02)
		var zoom_factor = zoom.x
		tile_map_layer.scale = Vector2(1.0 / zoom_factor, 1.0 / zoom_factor)
	elif not change:
		change = true
		Transição._transição()
		await Transição.fim_transição
		get_tree().change_scene_to_file("res://cutscenes/cenas/cutscene_foguete.tscn")
