extends Area2D

@onready var timer_letal: Timer = $Timer_letal

@onready var caixa_papelão: Area2D = $caixas/caixa_papelão
@onready var pluto_correndo: CharacterBody2D = $pluto_correndo

func _on_body_entered(body: Node2D) -> void:
		if body == pluto_correndo:
			timer_letal.start()
			print("Morreu")
	   
