extends Button
@export var window:ItemWindow
func _ready() -> void:
	window.visible=false


func _on_pressed() -> void:
	window.visible=true
