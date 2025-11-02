extends AnimatedSprite2D
func _ready():
	play()
	visible=false
func _process(delta):
	await get_tree().create_timer(10).timeout
	visible=true
	position.x+= 100*delta
	
	
