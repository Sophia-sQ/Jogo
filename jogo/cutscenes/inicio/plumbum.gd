extends AnimatedSprite2D

@export var speed := 100.0
@export var margin := 32.0

var direction := Vector2(randf_range(-1, 1), randf_range(-1, 1))

func _ready():
	randomize()
	
	# Corrige direção: nunca só vertical/horizontal
	if abs(direction.x) < 0.2:
		direction.x = 0.3 * sign(randf_range(-1, 1))
	if abs(direction.y) < 0.2:
		direction.y = 0.3 * sign(randf_range(-1, 1))
	direction = direction.normalized()
	
	play() # inicia animação do Plumbo

func _process(delta):
	position += direction * speed * delta

	var viewport_size = get_viewport_rect().size

	# colisão horizontal
	if position.x < margin:
		position.x = margin
		direction.x *= -1
	elif position.x > viewport_size.x - margin:
		position.x = viewport_size.x - margin
		direction.x *= -1

	# colisão vertical
	if position.y < margin:
		position.y = margin
		direction.y *= -1
	elif position.y > viewport_size.y - margin:
		position.y = viewport_size.y - margin
		direction.y *= -1
