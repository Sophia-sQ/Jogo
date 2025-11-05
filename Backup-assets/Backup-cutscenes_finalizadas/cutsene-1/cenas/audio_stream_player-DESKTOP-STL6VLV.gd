extends AudioStreamPlayer

func _ready():
	# Evita que múltiplas instâncias toquem
	if self != MusicaGlobal:
		queue_free()  # destrói duplicatas
	else:
		if not is_playing():
			play()
