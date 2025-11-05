extends AnimatedSprite2D

var mov = false

func _ready():
	Transição.fim_transição.connect(Callable(self, "_on_fim_transição"))
	visible = false
	print("timer start")
	await get_tree().create_timer(32).timeout
	print("timer 1 timeout")
	visible = true
	await get_tree().create_timer(0.8).timeout
	mov = true
	play()

	await get_tree().create_timer(3).timeout
	print("fim timer")
	mov = false
	print("inicio trasicao")
	Transição._transição()

func _process(delta: float) -> void:
	if mov:
		position.y -= 450 * delta
		position.x += 450 * delta

func _on_fim_transição():
	print("troca_cena")
	get_tree().change_scene_to_file("res://scenes/cena_1/cena1.tscn")
