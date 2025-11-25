extends Node2D
class_name Board

var ChosenItem:ItemButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var ChosenId=randi_range(1,7)
	print (ChosenId)
	
	var items:Array[Node]= get_tree().get_nodes_in_group("items")
	for item in items:
		if item.id==ChosenId:
			ChosenItem=item
			Global.ChosenId=ChosenId
			break


func _on_retry_pressed() -> void:
	get_tree().change_scene_to_packed(Global.BoardScene)
