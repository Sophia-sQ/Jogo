extends NinePatchRect

@onready var sprite: Node2D = $medica
signal fim_dialogo
@onready var text_box = preload("res://scenes/cena_2/dialogo_caixa.tscn")
var texto: Array[String] =[]
var linha: int = 0
var ativo = false
var avancar = false
var caixa_de_texto
var caixa_posicao: Vector2
var fala = 0
# Called when the node enters the scene tree for the first time.
func dialogo(posicao: Vector2, linhas: Array[String]):
	if ativo:
		return
	
	texto=linhas
	caixa_posicao=posicao
	mostrar_caixa_texto()
	ativo=true
	
func mostrar_caixa_texto():
	caixa_de_texto= text_box.instantiate()
	caixa_de_texto.acabou.connect(Callable(self, "_on_acabou"))
	get_parent().add_child(caixa_de_texto)
	caixa_de_texto.global_position=caixa_posicao
	caixa_de_texto.mostrar_texto(texto[linha])
	avancar=false
	
func _on_acabou():
	avancar=true
	
func _unhandled_input(event: InputEvent) -> void:
	if (event.is_action_pressed("space") &&
	ativo):
		caixa_de_texto.queue_free()
		linha+=1
		if linha >= texto.size():
			ativo=false
			linha=0
			fala+=1
			print("fala= ", fala)
			fim_dialogo.emit()
			return
		mostrar_caixa_texto()
