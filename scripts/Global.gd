extends Node

var BoardScene:PackedScene

var ChosenItem:ItemButton
var ChosenId:int


var step_counter:int = 0 ##counter gia  to poia erwthsh einai ara kai poio vhma na kanei sto screen panw
var in_pressed_action := false## ama kapoio koympei leitoyrgei ekeimh thn wra

var questions:Array[String]=[	## erwthseis gia na kanw identify ta antikeimena
	"Είναι κάτι που ένας μάγος θα ήθελε να έχει μαζί του;",
	"Έχει πάνω του στολίδια ή πολύτιμους λίθους;",
	"Μπορεί να θεωρηθεί “μαγικό αντικείμενο”;",
	"Μπορεί να χρησιμοποιηθεί για κάποιο “τελετουργικό”;",
	"Αν το χρησιμοποιήσεις λάθος, μπορεί να γίνει επικίνδυνο;",
	"Θα το έβρισκες σε έναν κήπο;",
	"Έχει φτερά;",
	"Μπορεί να συνδεθεί με τη φύση ή το νερό;",
] 


##tyxaia epilogh toy antikeimenoy poy prepei na vrei o paixths
func _ready() -> void: ##load toy game gia na mhn exei loading time
	
	BoardScene=preload("res://scenes/board.tscn")
	
	
	var items:Array[Node]= get_tree().get_nodes_in_group("items")##vres poio antikeimeno einai 
	for item in items:
		if item.id==ChosenId:
			ChosenItem=item
			break
