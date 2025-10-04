extends MarginContainer

signal acabou

@onready var label: Label = $MarginContainer/Label
@onready var timer: Timer = $Timer

const MAX_WIDTH = 128
var fala: String
var letra=0
var letra_passa = 0.03
var espaco = 0.06
var pontuacao = 0.2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func mostrar_texto(texto_mostra: String):
	fala=texto_mostra
	label.text=texto_mostra
	await resized
	custom_minimum_size.x= min(size.x, MAX_WIDTH)
	
	if size.x>MAX_WIDTH:
		label.autowrap_mode=TextServer.AUTOWRAP_WORD
		await resized #pro x
		await resized #pro y
		custom_minimum_size.y = size.y
	global_position.x-=size.x/2
	global_position.y-=size.y+24
	label.text=""
	mostrar_letra()

func mostrar_letra():
	label.text += fala[letra]
	letra+=1
	if letra >= fala.length():
		acabou.emit()
		return
	
	match fala[letra]:
		".", "?", "!":
			timer.start(pontuacao)
		" ":
			timer.start(espaco)
		_:
			timer.start(letra_passa)
		
	

func _on_timer_timeout() -> void:
	mostrar_letra()
