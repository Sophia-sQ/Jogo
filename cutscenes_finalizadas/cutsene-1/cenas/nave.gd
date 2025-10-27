extends AnimatedSprite2D
var mov=false
func _ready():
	visible=false
	await get_tree().create_timer(40).timeout
	visible=true
	mov=true
	play()
func _process(delta: float) -> void:	
	if mov:
		await get_tree().create_timer(2).timeout
		position.y -= 450*delta
		position.x +=450*delta
	else:	
		await get_tree().create_timer(47.8).timeout

		get_tree().change_scene_to_file("res://cenas/cutscene_estagiario.tscn")

		
