extends AnimatedSprite2D
func _ready():
	visible =false
func _process(delta):
	
	await get_tree().create_timer(6.7).timeout
	visible=true
	position.y+=98*delta
	if position.y>=563:
		position.y=563
	if position.y==	563:
		await get_tree().create_timer(6.6).timeout
		visible=false

		
