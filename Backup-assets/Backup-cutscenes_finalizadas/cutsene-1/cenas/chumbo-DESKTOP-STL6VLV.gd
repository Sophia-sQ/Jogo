extends AnimatedSprite2D
func _ready():
	visible= false
	await get_tree().create_timer(23).timeout
	visible= true
	play()
func _process(delta):
	if visible==true:
		await get_tree().create_timer(1.4).timeout
		
		position.x -= 35 * delta
		if position.x <= 761:
			position.x = 761
			visible = false
		
