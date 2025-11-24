extends Control

class_name ItemWindow
@export var buttons:Control
@export var board:Board

@onready var character: Character = %Character

func _ready() -> void: ## dhmiourgia toy box me tis erwthseis 
	for i in len(Global.questions) :
		var button:=Button.new()
		button.text=Global.questions[i]
		buttons.add_child(button)
		button.pressed.connect(on_press.bind(i))

func on_press(id:int): ##to ai gia na apantaei katallhla me to antikeimeno 
	if character.is_moving or Global.in_pressed_action:
		return
	
	Global.in_pressed_action = true
	Global.step_counter += 1
	
	if Global.ChosenItem.answers[id]:
		%Answer.text="NAI!"
		
	else:
		%Answer.text="OXI!"
	
	character.sequenced_move()
	
	await get_tree().create_timer(0.5).timeout ##dinw xrono ston paixth na dei thn apanthsh
	visible=false ##diwxnw to parathyro
	Global.in_pressed_action = false
