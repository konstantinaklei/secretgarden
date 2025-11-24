extends Node2D
class_name Character

signal move_finished

@export var move_speed:float
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D

var is_moving := false

func move(target_pos:Vector2):
	is_moving = true
	
	var stop_animation_name := _play_animation(target_pos)
	
	var tween := create_tween()
	tween.tween_property(self,"global_position", target_pos, move_speed)
	await tween.finished

	sprite.play(stop_animation_name)
	is_moving = false
	move_finished.emit()

func _play_animation(target_pos:Vector2) -> String:
	if target_pos.y < global_position.y:
		sprite.play("up")
		return "idle"
	elif target_pos.x < global_position.x:
		sprite.play("left")
		return "idle_left"
	elif target_pos.x > global_position.x:
		sprite.play("right")
		return "idle_right"
	return ""

func sequenced_move():
	match Global.step_counter: ## dhmioyrgia twn defualt kinhsewn toy paixth 
		1:
			print("move 1")
			move(Vector2(-28, 347))
			await move_finished
			await get_tree().create_timer(0.1).timeout
			move(Vector2(-275, 347))
		2:
			print("move 2")
			move(Vector2(-275, 112))
			await move_finished
			await get_tree().create_timer(0.1).timeout
			move(Vector2(33, 112))
		3:
			print("move 3")
			move(Vector2(349, 112))
		4:
			print("move 4")
			move(Vector2(349, -193))
			await move_finished
			await get_tree().create_timer(0.1).timeout
			move(Vector2(97, -193))
		5:
			print("move 5")
			move(Vector2(-26, -193))
			await move_finished
			await get_tree().create_timer(0.1).timeout
			move(Vector2(-26, -451))
		6:
			print("eisai o petros kai exases insallah")
			move(Vector2(global_position.x, -650))
			await move_finished
			await get_tree().create_timer(0.1).timeout
			$"../Lose Screen".visible=true
