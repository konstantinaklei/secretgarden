extends TextureButton
class_name ItemButton
@export var id :int
@export var answers:Array [bool]
func _ready() -> void:
	add_to_group("items")
