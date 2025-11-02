extends AnimatedSprite2D
var pega=false
@onready var astronauta_and_esq: AnimatedSprite2D = $"../astronauta_and_esq"

func _ready():
	visible= true
	await get_tree().create_timer(17.5).timeout
	await get_tree().create_timer(1.4).timeout
	pega= true
	
	play()
func _process(delta):
	if pega==true:
		
		position.x -= 40 * delta
		if position.x <= 755:
			position.x = 753
			#visible = false
			
	if astronauta_and_esq.foguete==true:
		visible=false	
		
