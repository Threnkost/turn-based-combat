extends YSort

#This class is to figure out turns.
class_name TurnQueue

#The battleground.
onready var battleground
onready var label #Not necessary.

#Active battler.
var activeCharacter : Battler

func _ready():
	battleground = get_parent()
	label = battleground.get_node("Test")

func initialize() -> void:
	activeCharacter = get_child(0)
	activeCharacter.get_node("Queue").visible = true
	
	#Not necessary.
	print("Started with : ", activeCharacter.name)

#Plays active character's turn.
func playTurn() -> void:
	activeCharacter.playTurn(self)

#Skips this turn and picks a new active character for next turn.
func skipTurn() -> void:
	#Sets false current active character's indicator. (The white box in combat.)
	activeCharacter.get_node("Queue").visible = false
	
	#Choses next active character.
	var nextIndex = (activeCharacter.get_index() + 1) % get_child_count()
	activeCharacter = get_child(nextIndex)
	
	#Sets true next active character's indicator.
	activeCharacter.get_node("Queue").visible = true
	
	#If next active character is Enemy, will play it automatically.
	if activeCharacter is Enemy:
		playTurn()

#Ummm, To be honest, I don't know xD
#I will add user interface later.
func _process(delta):
	if activeCharacter is Ally:
		if Input.is_action_just_pressed("skipTurn"): #Skips current turn.
			skipTurn()
		elif Input.is_action_just_pressed("playTurn"): #Plays active character's (Ally) turn.
			playTurn()
