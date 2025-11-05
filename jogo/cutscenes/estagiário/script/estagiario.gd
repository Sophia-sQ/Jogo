extends AnimatedSprite2D
var corre=false
var once:=false
func _ready():
	visible=true
	play("idle")

func _process(delta):

	await get_tree().create_timer(6.5).timeout
	if once==false:
		play("susto")
	if corre==true:
		play("corre")
		position.x+=5


func _on_animation_finished() -> void:
	if animation=="susto" and once==false:
		once=true
		##deixa ele assustado por mais tempo
		frame=1
		await get_tree().create_timer(1).timeout
		stop()
		corre=true
		
