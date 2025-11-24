extends Node2D

func _on_play_pressed() -> void:
	get_tree().change_scene_to_packed(Global.BoardScene)##pane me sto main screen

func _on_quit_pressed() -> void:
	get_tree().quit()#kleise to programma

func _on_options_pressed() -> void:
	pass # Replace with function body.
