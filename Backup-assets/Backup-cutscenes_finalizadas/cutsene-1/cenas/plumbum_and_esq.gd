extends AnimatedSprite2D
const SPEED = 18
const LIMITE = 408



var indo= true
var esperando= false
var tempo_espera= 0
var voltando= false

func _ready():
	visible= false
	await get_tree().create_timer(6.9).timeout
	visible= true
	play()

func _process(delta):
	#Astronauta indo no limite
	if indo:
		if position.x > LIMITE:
			position.x -= SPEED * delta
		else:
			if not esperando:
				esperando = true
				tempo_espera = 0
			else:
				tempo_espera += delta
				if tempo_espera >= 2:
					flip_h = true
					play()
					indo = false
					voltando = true
					esperando = false
	
	# Indo para a direita (até 1008)
	elif voltando:
		position.x += 60 * delta
		if position.x >= 1020:
			flip_h = false
			play()
			voltando = false  # começa a voltar no próximo ciclo

	# Voltando para o ponto 761
	else:
		position.x -= 40* delta
		if position.x <= 761:
			position.x = 761
			stop()
			visible = false
		
