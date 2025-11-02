extends Node2D

func _ready() -> void:
	Gerenciador.add_item.connect(Callable(self, "_on_add_item"))
	Gerenciador.lose_item.connect(Callable(self, "_on_lose_item"))
	
func _on_add_item(item: String):
	pass
	
func _on_lose_item(item: String):
	pass
