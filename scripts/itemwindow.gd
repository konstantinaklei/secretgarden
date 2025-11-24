extends Control

class_name ItemWindow
@export var buttons:Control
@export var board:Board

@onready var character: Character = %Character



func _ready() -> void:
	for i in len(Global.questions) :
		var button:=Button.new()
		button.text=Global.questions[i]
		buttons.add_child(button)
		button.pressed.connect(on_press.bind(i))

func on_press(id:int):
	if character.is_moving or Global.in_pressed_action:
		return
	
	Global.in_pressed_action = true
	Global.step_counter += 1
	
	if board.ChosenItem.answers[id]:
		%Answer.text="NAI!"
		
	else:
		%Answer.text="OXI!"
	
	match Global.step_counter:
		1:
			print("move 1")
			character.move(Vector2(-28, 347))
			await character.move_finished
			await get_tree().create_timer(0.1).timeout
			character.move(Vector2(-275, 347))
		2:
			print("move 2")
			character.move(Vector2(-275, 112))
			await character.move_finished
			await get_tree().create_timer(0.1).timeout
			character.move(Vector2(33, 112))
		3:
			print("move 3")
			character.move(Vector2(349, 112))
		4:
			print("move 4")
			character.move(Vector2(349, -193))
			await character.move_finished
			await get_tree().create_timer(0.1).timeout
			character.move(Vector2(97, -193))
		5:
			print("move 5")
			character.move(Vector2(-26, -193))
			await character.move_finished
			await get_tree().create_timer(0.1).timeout
			character.move(Vector2(-26, -451))
		6:
			print("eisai o petros kai exases insallah")
			character.move(Vector2(character.global_position.x, -650))
			await character.move_finished
			await get_tree().create_timer(0.1).timeout
			$"../Lose Screen".visible=true
			
	
	await get_tree().create_timer(0.5).timeout
	visible=false
	Global.in_pressed_action = false
