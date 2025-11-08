extends AnimatedSprite2D

func _ready():
	play()
	visible=true
	
func _process(delta):
	await get_tree().create_timer(12.9).timeout
	visible=false
	

	
