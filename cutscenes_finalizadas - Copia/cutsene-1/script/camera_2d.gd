extends Camera2D

@onready var tile_map_layer: TileMapLayer = $TileMapLayer

func _process(delta: float) -> void:
	if zoom.x < 6:
		# Aplica zoom
		zoom += Vector2(0.02, 0.02)
		
		# Faz o tile_map_layer se afastar 
		var zoom_factor = zoom.x
		tile_map_layer.scale = Vector2(1.0 / zoom_factor, 1.0 / zoom_factor)
	else:
		# Quando o zoom atingir 6 ou mais, troca de cena
		get_tree().change_scene_to_file("res://cenas/cutscene_foguete.tscn")
