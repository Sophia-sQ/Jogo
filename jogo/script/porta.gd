
extends Node2D

@onready var camera: Camera2D = $"../pluto_em_pe/Camera2D"
@onready var tile_map: TileMap = $TileMap
@onready var pluto_em_pe: CharacterBody2D = $"../pluto_em_pe"
@onready var cena2: Node2D = $".."



func _on_porta_escritorio_body_entered(body: Node2D) -> void:
	if body != tile_map:
		print("Corpo não é tilemap (Porta)")
		if body==pluto_em_pe:
			if cena2.area==2:
				print("Corpo vai pro escritorio")
				body.position.x=-2721.0
				body.position.y=-273.0
				#camera.limit_right=-2364
				#camera.limit_left=-3164
				#camera.limit_bottom=-293
				
				
				#tira as limitações da camera
				camera.limit_right=10000000
				camera.limit_left=-10000000
				camera.limit_bottom=10000000
				camera.limit_top=-10000000
			if cena2.area==3:
				print("Corpo volta pro corredor")
				
			
		
