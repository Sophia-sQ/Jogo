extends Area2D

@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var medica: Node2D = $".."
var dentro=false
var once=false
@onready var cena_2: Node2D = $"../.."
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Dialogos.fim_dialogo.connect(Callable(self, "_on_fim_dialogo"))
	collision_shape.disabled=true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#primera parte recebimento do cracha
	if dentro==true and cena_2.area==1:
		if Input.is_action_just_pressed("space"):
			medica.cracha=true
			Gerenciador.lose_item.emit("crachá")
			##cracha nao esta mais com plumbum
			if once==false:
				#começa segunda parte do dialogo
				Dialogos.dialogo(medica.global_position, medica.falas2)
				once=true
			collision_shape.disabled=true
	if cena_2.area==2:
		collision_shape.disabled=true
		##inverte estado da variavel para recebimento dos itens
		once=false
		if Input.is_action_just_pressed("space") and medica.itens["chave de fenda"]==true and medica.itens["combustível"]==true and medica.itens["metal"]==true:
			print("entrega itens")
			#Gerenciador.lose_item.emit("crachá")
			#print("Crachá lose (pega)")
			##recebimento
			if once==false:
				medica.itens["chave de fenda"]=false
				medica.itens["combustível"]=false 
				medica.itens["metal"]=false
				Dialogos.dialogo(medica.global_position, medica.falas4)
				once=true
func _on_body_entered(body: Node2D) -> void:
	print("Corpo na area (pega)")
	dentro=true

func _on_body_exited(body: Node2D) -> void:
	print("Corpo fora (pega)")
	dentro=false
	
func _on_fim_dialogo():
	##reativa a area apos receber o cracha
	if Dialogos.linha==0 and Dialogos.fala==1 and cena_2.area==1:
		collision_shape.disabled=false
	else:
		collision_shape.disabled=true
		
	
	
