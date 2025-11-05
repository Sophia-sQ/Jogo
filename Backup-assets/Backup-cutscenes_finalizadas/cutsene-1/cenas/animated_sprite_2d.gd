extends AnimatedSprite2D

const SPEED = 100
const LIMIT_Y = 440
const FINAL_Y = 504

var mov= true

func _ready():
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
		else:
			
			await get_tree().create_timer(30).timeout
			rotation = deg_to_rad(30) 
			position.y -= 450 * delta
			position.x +=450 *delta
			
			
	
			
