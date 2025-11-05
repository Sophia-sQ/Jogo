extends Control

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_tree().paused==true:
		visible=false
	else:
		visible=true

func _chamado():
	if get_tree().paused==true:
		visible=false
	else:
		visible=true

func _on_pause_pressed() -> void:
	get_tree().paused=true
