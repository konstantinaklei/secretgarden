extends Control

class_name ItemWindow
@export var buttons:Control
@export var board:Board
func _ready() -> void:
	for i in len(Global.questions) :
		var button:=Button.new()
		button.text=Global.questions[i]
		buttons.add_child(button)
		button.pressed.connect(on_press.bind(i))
func on_press(id:int):
	if board.ChosenItem.answers[id]:
		%Answer.text="NAI!"
		
	else:
		%Answer.text="OXI!"
	await get_tree().create_timer(3).timeout
	visible=false
