extends Node2D
@onready var animated_sprite_2d: AnimatedSprite2D = $concerto
signal animacao
func _ready() -> void:
	Geral._tocar_musica(0)
	animated_sprite_2d.flip_h=true
	animated_sprite_2d.play("default")
	await animacao
	animated_sprite_2d.play("voando")
	await get_tree().create_timer(3).timeout
	Transição._transição()
	Geral._tocar_musica(1)
	#await get_tree().create_timer(2).timeout
	#animated_sprite_2d.play("voando")
	#animated_sprite_2d.frame=20
	
	Transição.fim_transição.connect(Callable(self, "_on_fim_transição"))
	
func _on_concerto_animation_finished() -> void:
	animacao.emit()
	#if animated_sprite_2d.animation=="default":
		#animated_sprite_2d.play("voando")
	#if animated_sprite_2d.animation=="voando" and animated_sprite_2d.frame==20:
		#Transição._transição()

func _on_fim_transição():
	Gerenciador.fim=true
	get_tree().change_scene_to_file("res://scenes/créditos.tscn")
