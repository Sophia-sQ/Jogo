extends Label

@onready var timer: Timer = $Timer
@onready var label: Label = $"."

var liga = 0
var repete=0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
		

##faz texto piscar
func _on_timer_timeout() -> void:
	if liga == 0 and repete<5:
		liga = 1
		label.visible_ratio = 0
		timer.wait_time = 0.5
		timer.start()
		repete += 1
	elif liga==1 and repete<5:
		liga = 0
		repete += 1
		label.visible_ratio = 1
		timer.wait_time = 0.5
		timer.start()
	else:
		queue_free()
