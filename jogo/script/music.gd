extends AudioStreamPlayer2D

var cena
enum parte {GERAL=1, PRIMEIRA=2, TERCEIRA=3, NADA=0}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	stream = preload("res://assets/sound/music/Geral.mp3")
	play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _tocar_musica(musica: int):
	await get_tree().process_frame
		
	if musica == parte.GERAL:
		stream = preload("res://assets/sound/music/Geral.mp3")
	elif musica == parte.PRIMEIRA:
		stream = preload("res://assets/sound/music/Asteroide.mp3")
	elif musica == parte.TERCEIRA:
		stream = preload("res://assets/sound/music/Guarda.mp3")
	
	if musica == parte.NADA:
		stop()
	else:
		play()
