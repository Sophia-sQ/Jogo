extends Node2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
@onready var timer: Timer = $Timer
var coracoes
func _ready() -> void:
	coracoes = Gerenciador.health
	animated_sprite.frame = 0
	Gerenciador.kill.connect(Callable(self, "_on_kill"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
		if Gerenciador.health<coracoes:
			animated_sprite.frame+=2
			coracoes = Gerenciador.health
