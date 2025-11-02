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
	if dentro==true:
		if Input.is_action_just_pressed("space"):
			print("entrega")
			medica.cracha=true
			Gerenciador.lose_item.emit("crachá")
			print("Crachá lose (pega)")
			if once==false:
				Dialogos.dialogo(medica.global_position, medica.falas2)
				once=true
	if cena_2.area==2:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	print("Corpo na area (pega)")
	dentro=true

func _on_body_exited(body: Node2D) -> void:
	print("Corpo fora (pega)")
	dentro=false
	
func _on_fim_dialogo():
	if Dialogos.linha==0 and Dialogos.fala==1 and cena_2.area==1:
		collision_shape.disabled=false
	else:
		collision_shape.disabled=true
		
	
	
