extends Node2D
@onready var plumbum_par=$plumbum_par
@onready var astronauta=$astronauta_and_esq
@onready var serio=$serio


func _ready():
	plumbum_par.visible=true
	serio.visible=false
func _process(delta):

	if astronauta.position.x <= 408:
		plumbum_par.visible = false
		serio.visible = true	

		
			
