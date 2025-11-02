extends AnimatedSprite2D
const SPEED = 80
const LIMITE = 408
var foguete=false


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
				stop()
				if tempo_espera >= 2:
					flip_h = true
					play()
					indo = false
					voltando = true
					esperando = false
	
	# Indo para a direita (até 1008)
	elif voltando:
		position.x += 90 * delta
		if position.x >= 1020:
			flip_h = false
			play()
			voltando = false  # começa a voltar no próximo ciclo

	# Voltando para o ponto 753
	else:
		position.x -= 40 * delta
		if position.x <= 753:
			position.x = 753
			foguete=true
			stop()
			visible = false
		
