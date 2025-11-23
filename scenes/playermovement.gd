extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	pass
func go_to_point(target: Vector2):
	var tween = create_tween()
	tween.tween_property(self, "global_position", target, 0.4)

#auti i sinartisi einai gia na pigainei o paiktis apo ti mia gonia stin alli kanontas vimata
#gia paradeigma play(up)  go_to_point(Vector2(500, 200))
