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
