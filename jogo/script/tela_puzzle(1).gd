extends Control

@export var resposta: String
@onready var pergunta: Label = $Sprite2D/pergunta
@onready var button_a: Button = $Sprite2D/a
@onready var button_b: Button = $Sprite2D/b
@onready var button_c: Button = $Sprite2D/c
@onready var fechar: TextureButton = $Sprite2D/fechar
signal correto

func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _chamado(bau: int):
	var p: String
	var a: String
	var b: String
	var c: String
	if bau==1:
		p="O que é a camada de valência de uma átomo?"
		a="a. Camada com mais elétrons"
		b="b. Camada mais externa"
		c="c. camada com mais nêutrons"
	elif bau==2:
		p="Sabendo que Plumbum é o nome de um elemento em latim e que tem número atômico 82. Quem é Plumbum?"
		a="a. O protagonista Z = 733.423.413-95(5) A = 65kg"
		b="b. Polônio Z = 84 A = 209"
		c="c. Chumbo Z = 82 A = 207"
	elif bau==3:
		p="Se radônio está no período 6 e no bloco p da tabela períodica, qual é a sua camada mais externa com elétrons?"
		a="a. 1s"
		b="b. p66"
		c="c. 6p"
	visible=true
	_able()
	fechar.disabled=false
	_texto(p, a, b, c)

func _texto(p: String, a: String, b: String, c: String):
	pergunta.text=p
	button_a.text=a
	button_b.text=b
	button_c.text=c


func _on_fechar_pressed() -> void:
	visible=false
	get_tree().paused=false


func _on_c_pressed() -> void:
	if resposta=="c":
		_texto("Correto. A tela fechará automáticamente", "a. correto", "b. correto", "c. correto")
		_certo()
	else:
		_texto("Feche (X) e tente novamente.", "a. errado", "b. errado", "c. errado")
	_disabled()


func _on_b_pressed() -> void:
	if resposta=="b":
		_texto("Correto. A tela fechará automáticamente", "a. correto", "b. correto", "c. correto")
		_certo()
	else:
		_texto("Feche (X) e tente novamente.", "a. errado", "b. errado", "c. errado")
	_disabled()


func _on_a_pressed() -> void:
	if resposta=="a":
		_texto("Correto. A tela fechará automáticamente", "a. correto", "b. correto", "c. correto")
		_certo()
	else:
		_texto("Feche (X) e tente novamente.", "a. errado", "b. errado", "c. errado")
	_disabled()
		
func _disabled():
	button_a.disabled=true
	button_b.disabled=true
	button_c.disabled=true
	
func _able():
	button_a.disabled=false
	button_b.disabled=false
	button_c.disabled=false
	
func _certo():
	fechar.disabled=true
	await get_tree().create_timer(3.7).timeout
	correto.emit()
	_on_fechar_pressed()
	queue_free()

	
