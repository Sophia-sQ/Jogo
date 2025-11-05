extends Node2D
@onready var text_box: MarginContainer = $text_box
@onready var pluto_em_pe: CharacterBody2D = $"../pluto_em_pe"
@onready var animacao: AnimatedSprite2D = $AnimatedSprite2D
@onready var gatilho_dialogo: Area2D = $"../gatilho_dialogo"
var cracha=false
##armazena itens e falas
var itens={"chave de fenda": false,
			"combustível": false,
			"metal": false}
var once:=false
@onready var cena2: Node2D = $".."
var campo_visao:=-656
const falas1: Array[String] = ["Hum. . . ",
"Você sabia que apenas pessoas autorizadas podem entrar?",
"Pensando bem, ",
"Estou esperando o novo estagiário. . . ",
"Só pode ser você!",
"Cadê seu crachá? ",
"Você pode usar espaço para me entregar."]

const falas2: Array[String]= ["Venha comigo e eu vou te mostrar como as coisas funcionam."]

const falas3: Array[String]= ["Bem. . . ",
"Meu nome é Sulphuris e sou a sua encarregada a partir de agora.",
"A área mais a esquerda é o laboratório, mas também há uma entrada pelo estoque.",
"Os mais recentes experimentos têm envolvido energia extraterrestre vinda do planeta Radonium.",
"Nunca houve ninguém capaz de chegar perto do que temos feito!",
"Apesar da emoção, a entrada ao laboratório só é autorizada aos mais grandes químicos do país.",
"A sua função é cuidar do nosso estoque e garantir que todos os itens estarão preparados.",
"Sua primeira tarefa é: trazer uma chave de fenda, metais e combustível alienígena.",
"Resolva sua tarefa e venha me contar ."]

const falas4: Array[String]=["Muito bem!",
"O nosso próximo esperimento será em breve.",
"Você pode colocar os itens na sala do laboratório?",
"É a porta à esquerda no final do corredor.",
"Mas muito importante... não toque em nada, especialmente na relíquia alienígena!",
]

func _ready() -> void:
	Gerenciador.add_item.connect(Callable(self, "_on_add_item"))
	Gerenciador.lose_item.connect(Callable(self, "_on_lose_item"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
##player pode dar a volta
func _process(delta: float) -> void:
	var player_x = pluto_em_pe.position.x
	var player_y = pluto_em_pe.position.y
	if player_y<121:
		z_index=1
	else:
		z_index=-1
			
	var dentro_faixa_y = player_y >= 95 and player_y <= 125
##muda posição e a "volta" do player
	if cena2.area==2:
		position=Vector2(-1192, 89)
		once=false
		campo_visao=-1196
	else:
		campo_visao=-656
	
	if dentro_faixa_y and once==false:
		if player_x <= campo_visao:
			animacao.play("idle_esquerda")
		else:
			animacao.play("idle_direita")
	elif (cracha==false and once == false) or cena2.area==2:
		animacao.play("idle_frente")
	##anda ao recebr cracha
	if cracha==true and Dialogos.linha==0 and Dialogos.fala==2 and cena2.area==1:
		if once==false:
			pass
			once=true
		else:
			animacao.play("andando")
			position.x-=0.6
	
func _on_add_item(item: String):
	print("recebido add", item)
	if item=="chave de fenda":
		itens["chave de fenda"]=true
	elif item=="combustível":
		itens["combustível"]=true
	elif item=="metal":
		itens["metal"]=true

#func _on_add_item(item: String):
	#print("recebido add")
	#if item=="chave de fenda":
		#itens["chave de fenda"]=false
	#elif item=="combustível":
		#itens["combustível"]=false
	#elif item=="metal":
		#itens["metal"]=false
	#elif item=="crachá":
		#cracha=false
