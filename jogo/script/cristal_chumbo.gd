extends Area2D

@onready var node_2d: CharacterBody2D = $Node2D

var c
var p

func _on_body_entered(body: Node2D) -> void:
	if body == node_2d:
		c == 1

func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_space"):
		p == 1
		
	if c == 1 and p == 1:
		queue_free()
