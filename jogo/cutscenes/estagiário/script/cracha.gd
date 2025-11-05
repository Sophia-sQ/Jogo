extends AnimatedSprite2D
var cair:=false
@onready var label: Label = $"../Label"

func _ready():
	visible =false
	await get_tree().create_timer(8.5).timeout
	visible=true
	cair=true
	print("start")
	await get_tree().create_timer(5.6).timeout
	visible=false
	#await get_tree().create_timer(1).timeout
	#label.visible=true
	#await get_tree().create_timer(4).timeout
	#label.visible=false
func _process(delta):
	if cair==true:
		if position.y<=563:
			position.y+=98*delta
			#position.y=563
		#if position.y==563:
			

		
