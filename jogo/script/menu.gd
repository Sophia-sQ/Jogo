extends Control




func _on_jogar_pressed() -> void:
	get_tree().change_scene_to_file("res://cutscenes/cenas/espaço.tscn")


func _on_guia_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/guia.tscn")


func _on_sair_pressed() -> void:
	get_tree().quit()


func _on_creditos_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/créditos.tscn")
