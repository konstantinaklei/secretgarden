extends Node2D
class_name Board




func _on_retry_pressed() -> void:
	get_tree().change_scene_to_packed(Global.BoardScene)
