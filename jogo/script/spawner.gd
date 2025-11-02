extends Node2D

@onready var timer: Timer = $Timer
@onready var asteroide = preload("res://scenes/cena_1/asteroide.tscn")
var wait = 0
@onready var timer_2: Timer = $Timer2
@onready var gerenciamento: Node2D = $gerenciamento

func _ready() -> void:
	Gerenciador.morte.connect(Callable(self, "_on_morte"))

func _on_timer_timeout() -> void:
	if gerenciamento.fim==false:
		var num = randf()
		if num < 0.3:
			var ast = asteroide.instantiate()
			ast.position = position
			get_parent().get_parent().get_node("Asteroides").add_child(ast)
		wait += 1
		if wait > 2:
			timer.wait_time -= 0.5
			wait = 0
	else:
		timer.wait_time = 0.5
		var ast = asteroide.instantiate()
		ast.position = position
		get_parent().get_parent().get_node("Asteroides").add_child(ast)

func _on_morte():
	timer.one_shot = true
