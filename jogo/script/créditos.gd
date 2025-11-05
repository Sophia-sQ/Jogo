extends Control

@onready var cor_azul: ColorRect = $"cor azul"
@onready var planeta: TextureRect = $planeta
@onready var ganhou: TextureRect = $Node2D/credito/ganhou
@onready var node: Node2D = $Node2D
#1000
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Transição.fim_transição.connect(Callable(self, "_on_fim_transição"))
	##diferente dependendo se o player concluiu o jogo ou nao
	if Gerenciador.fim==true:
		ganhou.visible=true
		planeta.visible=true
	else:
		node.position.y=663
		ganhou.visible=false
		planeta.visible=false
	#Gerenciador.fim=false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	node.position.y-=30*delta
	if node.position.y<=-1400:
		Transição._transição()
		
func _on_fim_transição():
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")


func _on_voltar_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
