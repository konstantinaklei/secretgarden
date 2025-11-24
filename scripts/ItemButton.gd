extends TextureButton
class_name ItemButton
@export var id :int
@export var answers:Array [bool]

func _ready() -> void:
	add_to_group("items")
	pressed.connect(_on_pressed)

func _on_pressed():
	if id == Global.ChosenId:
		print("bravo petro")
	else:
		Global.step_counter += 1
		%Character.sequenced_move()
