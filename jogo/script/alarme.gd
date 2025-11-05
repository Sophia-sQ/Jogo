extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D
signal fim_alarme

func _ready() -> void:
	visible=false
	
func _alarme():
	visible=true
	animation_player.play("alarme")
	audio_stream_player_2d.play()
	await get_tree().create_timer(6.5).timeout
	audio_stream_player_2d.stop()

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name=="alarme":
		fim_alarme.emit()
		
