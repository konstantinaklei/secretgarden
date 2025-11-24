extends Node

var BoardScene:PackedScene


var step_counter:int = 0
var in_pressed_action := false

var questions:Array[String]=[
	"Είναι κάτι που ένας μάγος θα ήθελε να έχει μαζί του;",
	"Έχει πάνω του στολίδια ή πολύτιμους λίθους;",
	"Μπορεί να θεωρηθεί “μαγικό αντικείμενο”;",
	"Μπορεί να χρησιμοποιηθεί για κάποιο “τελετουργικό”;",
	"Αν το χρησιμοποιήσεις λάθος, μπορεί να γίνει επικίνδυνο;",
	"Θα το έβρισκες σε έναν κήπο;",
	"Έχει φτερά;",
	"Μπορεί να συνδεθεί με τη φύση ή το νερό;",
] 

func _ready() -> void:
	BoardScene=preload("res://scenes/board.tscn")
