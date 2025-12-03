extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# 1. Βεβαιωθείτε ότι συνδέετε το σήμα μία φορά (ασφαλής σύνδεση)
	if not http_request.request_completed.is_connected(_on_http_request_completed):
		http_request.request_completed.connect(_on_http_request_completed)

	# 2. Καλέστε τη λήψη του leaderboard όταν ξεκινάει η σκηνή
	get_leaderboard()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
# GDScript - LeaderboardManager.gd

# Η διεύθυνση του Express API σας (πρέπει να τρέχει!)
const API_BASE_URL = "http://localhost:3000/api/scores"

# Αναφορά στον κόμβο HTTPRequest
@onready var http_request = $HTTPRequest

# --------------------------------------------------------------------------
# 1. ΣΥΝΑΡΤΗΣΗ ΓΙΑ ΑΙΤΗΣΗ ΛΗΨΗΣ LEADERBOARD (GET)
# --------------------------------------------------------------------------

func get_leaderboard():
	if not is_instance_valid(http_request):
		print("Error: HTTPRequest node is missing or invalid.")
		return
		
		print("Requesting top 10 scores from API...")
	
	# Σύνδεση σήματος ολοκλήρωσης (γίνεται μόνο μία φορά)
	# Βεβαιωθείτε ότι αυτή η γραμμή τρέχει πριν το request, συνήθως στο _ready
		if not http_request.request_completed.is_connected(_on_http_request_completed):
			http_request.request_completed.connect(_on_http_request_completed)
	
	# Εκτέλεση GET request
	# PackedStringArray() = χωρίς custom headers
	# HTTPClient.METHOD_GET = Μέθοδος GET
	var error = http_request.request(API_BASE_URL, PackedStringArray(), HTTPClient.METHOD_GET)
	
	if error != OK:
		print("Error initiating GET request: ", error)

# --------------------------------------------------------------------------
# 2. ΧΕΙΡΙΣΜΟΣ ΤΗΣ ΑΠΑΝΤΗΣΗΣ (SIGNAL CALLBACK)
# --------------------------------------------------------------------------



# --------------------------------------------------------------------------
# 3. ΠΑΡΑΔΕΙΓΜΑ ΧΡΗΣΗΣ (ΚΑΛΕΙΤΑΙ ΜΟΝΟ ΑΦΟΥ ΕΧΕΙ ΦΟΡΤΩΘΕΙ Η ΣΚΗΝΗ)
# --------------------------------------------------------------------------
func send_score(player_name: String, final_score: int):
	if not is_instance_valid(http_request):
		print("Error: HTTPRequest node is missing or invalid for POST.")
		return
		
	# Εφόσον το _on_http_request_completed χειρίζεται τόσο GET όσο και POST
	# δεν χρειάζεται να αλλάξουμε τη σύνδεση του signal.
	
	var headers = ["Content-Type: application/json"]
	# Δημιουργία του JSON body
	var body = JSON.stringify({ "name": player_name, "score": final_score })

	print("Sending score: %s, %d" % [player_name, final_score])
	
	# Εκτέλεση POST request
	var error = http_request.request(API_BASE_URL, headers, HTTPClient.METHOD_POST, body)
	
	if error != OK:
			print("Error initiating POST request: ", error)

# --------------------------------------------------------------------------
# ΕΝΗΜΕΡΩΣΗ του _on_http_request_completed
# --------------------------------------------------------------------------
# Χρειάζεται να ενημερώσουμε τη συνάρτηση χειρισμού απάντησης 
func _on_http_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray):
	var response_text = body.get_string_from_utf8()

	if response_code == 200: # Επιτυχία GET
		# (Ο κώδικας για την λήψη του leaderboard παραμένει ίδιος)
		print("--- LEADERBOARD DATA RECEIVED ---")
		# ...
	elif response_code == 201: # Επιτυχία POST
		print("Score submitted successfully!")
	else:
		print("API Error (Code ", response_code, "): ", response_text)

# --------------------------------------------------------------------------
# ΠΩΣ ΚΑΛΕΙΤΕ ΤΗΝ ΑΠΟΣΤΟΛΗ
# --------------------------------------------------------------------------

# Για να χρησιμοποιήσετε την αποστολή, καλέστε τη συνάρτηση από το τέλος του παιχνιδιού:
# send_score("Konst", 10500)
#Στη συνέχεια, καλείτε τη λήψη του leaderboard (GET request)
	#get_leaderboard()
	#Σημείωση: Το get_leaderboard() υπάρχει ήδη στο _ready από την προηγούμενη επιτυχημένη δοκιμή.)
