extends CanvasLayer

@onready var color_rect: ColorRect = $ColorRect
@onready var animation_player: AnimationPlayer = $AnimationPlayer
signal fim_transição
func _ready() -> void:
	color_rect.visible=false
	
func _transição():
	color_rect.visible=true
	animation_player.play("escurecer")
	

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	##sefade in caba, avisa, inicia fade out. Se fade out acaba
	if anim_name=="escurecer":
		animation_player.play("desaparecer")
		fim_transição.emit()
	elif anim_name=="desaparecer":
		color_rect.visible=false
