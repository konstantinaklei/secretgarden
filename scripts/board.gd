extends Node2D
class_name Board
@onready var player = $AnimatedSprite2D


var ChosenItem:ItemButton

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.play("up")
	var ChosenId=randi_range(1,7)
	var items:Array[Node]= get_tree().get_nodes_in_group("items")
	for item in items:
		if item.id==ChosenId:
			ChosenItem=item
			break
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	pass
