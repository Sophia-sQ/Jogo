extends Node2D

@onready var camera: Camera2D = $pluto_em_pe/Camera2D
@onready var medica: Node2D = $medica
@onready var colisao_porta: CollisionShape2D = $Area_porta/CollisionShape2D
@onready var pluto_em_pe: CharacterBody2D = $pluto_em_pe
@onready var area_porta: CollisionShape2D = $Area_porta2/CollisionShape2D

var area := 1

func _ready() -> void:
	Gerenciador.passou_porta.connect(Callable(self, "_on_passou_porta"))
	Gerenciador.add_item.emit("crachá")

func _process(delta: float) -> void:
	if Dialogos.fala<2:
		colisao_porta.disabled=true
	else:
		colisao_porta.disabled=false
		
	if area==2 and Dialogos.fala<3:
		area_porta.disabled=true
	else:
		area_porta.disabled=false
			
func _on_passou_porta():
	if pluto_em_pe.position.x < -930 and pluto_em_pe.position.y>-200:
		area=2
		camera.limit_left=-1847
		camera.limit_right=-939
		camera.limit_bottom=175
	elif pluto_em_pe.position.x > -920 and pluto_em_pe.position.y>-200:
		camera.limit_left=-920
		camera.limit_right=294.5
		camera.limit_bottom=175
		area=1
	elif pluto_em_pe.position.x<-689 and pluto_em_pe.position.y<-240:
		camera.limit_left=-1418
		camera.limit_right=-858
		camera.limit_bottom=-261
		area=3
	
