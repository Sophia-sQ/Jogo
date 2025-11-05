extends Node2D

@onready var label: Label = $Label
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
@onready var timer: Timer = $Timer
var coracoes
func _ready() -> void:
	coracoes = Gerenciador.health
	animated_sprite.frame = 0
	Gerenciador.kill.connect(Callable(self, "_on_kill"))
	label.visible_characters=-1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	##controla HUD coracoes
		if Gerenciador.health<coracoes:
			animated_sprite.frame+=2
			coracoes = Gerenciador.health
