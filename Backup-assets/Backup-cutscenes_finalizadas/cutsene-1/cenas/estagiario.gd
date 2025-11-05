extends AnimatedSprite2D
func _ready():
	visible=true
	play()
	flip_h=true
func _process(delta):

	await get_tree().create_timer(6.5).timeout
	flip_h=false   
	visible=false
	
