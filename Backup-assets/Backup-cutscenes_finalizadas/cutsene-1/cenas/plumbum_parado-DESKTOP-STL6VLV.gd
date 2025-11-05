extends AnimatedSprite2D

var roda = false  

func _ready():
	play()
	visible = false

func _process(delta):
	if not roda:
		roda = true
		await get_tree().create_timer(4).timeout
		visible = true
		await get_tree().create_timer(6).timeout
		visible = false
		

	

	
