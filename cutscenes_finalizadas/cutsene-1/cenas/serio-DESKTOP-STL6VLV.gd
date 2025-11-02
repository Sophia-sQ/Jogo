extends AnimatedSprite2D

func _ready():
	visible=true
	play() 
	await get_tree().create_timer(39.9).timeout
	visible=false
