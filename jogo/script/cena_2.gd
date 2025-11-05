extends Node2D

@onready var camera: Camera2D = $pluto_em_pe/Camera2D
@onready var medica: Node2D = $medica
@onready var colisao_porta: CollisionShape2D = $Area_porta/CollisionShape2D
@onready var pluto_em_pe: CharacterBody2D = $pluto_em_pe
@onready var area_porta: CollisionShape2D = $Area_porta2/CollisionShape2D
var permitido
var area := 1
@onready var animation: AnimatedSprite2D = $pluto_em_pe/AnimatedSprite2D

func _ready() -> void:
	Gerenciador.passou_porta.connect(Callable(self, "_on_passou_porta"))
	Gerenciador.add_item.emit("crachá") ##da o cracha pro player
	##reseta variaveis que causavam problemas
	medica.cracha=false
	medica.itens["chave de fenda"]=false
	medica.itens["combustível"]=false
	medica.itens["metais"]=false
	Dialogos.texto=[]
	Dialogos.linha=0
	Dialogos.ativo = false
	Dialogos.avancar = false
	Dialogos.caixa_de_texto
	Dialogos.fala = 0
	print(medica.cracha, medica.itens, Dialogos.fala)
	
func _process(delta: float) -> void:
	if get_tree().paused==true:
		animation.play("idle_frente")
	if Input.is_action_just_pressed("pause"):
		get_tree().paused=true
	
	##controla portas passaveis ou nao
	if Dialogos.fala<2:
		colisao_porta.disabled=true
	elif area==2 and Dialogos.fala<3:
		colisao_porta.disabled=true
	else:
		colisao_porta.disabled=false
	##termino da fase
	if area==2 and Dialogos.fala<4:
		permitido=false
	else:
		permitido=true
			
func _on_passou_porta():
	##delimita as areas do mapa
	if pluto_em_pe.position.x < -930 and pluto_em_pe.position.y>-200:
		area=2
		camera.limit_left=-1844
		camera.limit_right=-939
		camera.limit_bottom=175
	elif pluto_em_pe.position.x > -920 and pluto_em_pe.position.y>-200:
		camera.limit_left=-920
		camera.limit_right=294.5
		camera.limit_bottom=175
		area=1
	elif pluto_em_pe.position.x<-689 and pluto_em_pe.position.y<-240:
		camera.limit_left=-1414
		camera.limit_right=-858
		camera.limit_bottom=-261
		area=3
	
