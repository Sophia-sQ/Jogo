#extends AnimatedSprite2D
#var mov=false
#func _ready():
	#visible=false
	#await get_tree().create_timer(40).timeout
	#visible=true
	#mov=true
	#play()
#func _process(delta: float) -> void:	
	#if mov:
		#await get_tree().create_timer(2).timeout
		#position.y -= 450*delta
		#position.x +=450*delta
	#else:	
		##46 segs
		#await get_tree().create_timer(46).timeout
		#Transição._transição()
		#await Transição.fim_transição
		#var error = get_tree().change_scene_to_file("res://scenes/cena_1/cena1.tscn")
		#if error != OK:
			#print("Erro ao trocar cena: ", error)
			
extends AnimatedSprite2D

var mov = false

func _ready():
	visible = false
	print("timer start")
	await get_tree().create_timer(32).timeout
	print("timer 1 timeout")
	visible = true
	await get_tree().create_timer(0.8).timeout
	mov = true
	play()

	## Depois de 46 segundos de movimento, parar e trocar de cena
	await get_tree().create_timer(3).timeout
	print("fim timer")
	mov = false
	print("inicio tranicao")
	Transição._transição()
	await Transição.fim_transição
	print("troca_cena")
	get_tree().change_scene_to_file("res://scenes/cena_1/cena1.tscn")


func _process(delta: float) -> void:
	if mov:
		position.y -= 450 * delta
		position.x += 450 * delta
