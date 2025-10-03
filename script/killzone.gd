extends Area2D

# Referencia o nó do jogador para checar a colisão
@onready var pluto_nave: CharacterBody2D = get_node("/root/Cena1/pluto_nave")

func _on_body_entered(body: Node2D) -> void:
	if body == pluto_nave:
		Gerenciador.kill.emit()
		print("Sinal 'kill' emitido para o gerenciador!")
		
		# Opcional: Você pode querer destruir o asteroide após a colisão
		# get_parent().queue_free()
