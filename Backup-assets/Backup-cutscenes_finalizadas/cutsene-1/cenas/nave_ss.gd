extends AnimatedSprite2D

func _ready():
	visible=false
	play() 
	await get_tree().create_timer(4).timeout
	visible=true
