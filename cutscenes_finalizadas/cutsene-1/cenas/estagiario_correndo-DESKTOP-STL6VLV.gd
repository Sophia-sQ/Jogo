extends AnimatedSprite2D
func _ready():
	visible=false
	play()
func _process(delta):
	await get_tree().create_timer(6.5).timeout
	visible=true
	position.x+= 200*delta 
