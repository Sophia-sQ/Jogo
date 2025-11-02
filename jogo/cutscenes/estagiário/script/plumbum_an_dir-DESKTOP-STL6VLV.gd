extends AnimatedSprite2D
var voltando:=false
func _ready() -> void:
	Transição.fim_transição.connect(Callable(self, "_on_fim_transição"))
	play()
	visible=false
func _process(delta: float) -> void:
	await get_tree().create_timer(10).timeout
	visible=true
	if voltando==false:
		position.x+=100*delta
		if position.x>=992:
			voltando=true
	else:
		position.x-=120*delta
		flip_h=true
		if position.x<=60:
			Transição._transição()

func _on_fim_transição():
	get_tree().change_scene_to_file("res://scenes/cena_2/cena2.tscn")
	
