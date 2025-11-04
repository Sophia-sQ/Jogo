extends AnimatedSprite2D



func _ready():
	visible = false  
	await get_tree().create_timer(4.9).timeout
	visible = true
	play() 
	await get_tree().create_timer(2.0).timeout
	visible = false  


		
