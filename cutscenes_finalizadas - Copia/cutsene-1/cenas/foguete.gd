extends AnimatedSprite2D
const SPEED=200
const LIMITy=430
var mov=true
func process(delta):
	if mov:
		position.x += SPEED * delta
		position.y += SPEED * delta
	if position.y>= LIMITy:
		mov= false	
	
