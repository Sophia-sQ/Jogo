extends  Area2D

@onready var medica: Node2D = $"../medica"
@onready var text_box: MarginContainer = $"../medica/text_box"
@onready var pluto_em_pe: CharacterBody2D = $"../pluto_em_pe"
var once=false
@onready var cena2: Node2D = $".."

func _ready() -> void:
	text_box.hide()
	Gerenciador.passou_porta.connect(Callable(self, "_on_passou_porta"))

func _on_body_entered(body: Node2D) -> void:
	##controla quando ativa na area 1 e 2 da cena 2
	if body == pluto_em_pe and once ==false and cena2.area==1:
		once=true
		Dialogos.dialogo(medica.global_position, medica.falas1)
	elif body == pluto_em_pe and cena2.area==2 and Dialogos.fala<3:
		Dialogos.dialogo(medica.global_position, medica.falas3)

func _on_passou_porta():
	if pluto_em_pe.position.x < -930 and pluto_em_pe.position.y>-200:
		position.x=-1093
