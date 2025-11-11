extends Button
var BoardScene:PackedScene
func _ready() -> void:
	BoardScene=preload("res://scenes/board.tscn")

func _on_pressed() -> void:
	get_tree().change_scene_to_packed(BoardScene)
