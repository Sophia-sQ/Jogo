extends AnimatedSprite2D

const SPEED = 185
const LIMIT_Y = 440
const FINAL_Y = 504

var mov= true

func _ready():
	Geral._tocar_musica(0)
	visible=true
	play()

func _process(delta):
	if mov:
		
		position.x -= SPEED * delta
		position.y += SPEED * delta
		
		
		if position.y >= LIMIT_Y:
			mov= false
			rotation = deg_to_rad(0)   

	else:
		
		if position.y < FINAL_Y:
			position.y += SPEED * delta
	if mov==false:
		await get_tree().create_timer(1.4).timeout
		visible=false
