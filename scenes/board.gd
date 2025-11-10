extends Node2D
@onready var player = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.play("up")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
