extends YSort

class_name TurnQueue

onready var battleground
onready var label

var activeCharacter : Battler

func _ready():
	battleground = get_parent()
	label = battleground.get_node("Test")

func initialize() -> void:
	activeCharacter = get_child(0)
	activeCharacter.get_node("Queue").visible = true
	print("Started with : ", activeCharacter.name)

func playTurn() -> void:
	activeCharacter.playTurn(self)
	
func skipTurn() -> void:
	activeCharacter.get_node("Queue").visible = false
	var nextIndex = (activeCharacter.get_index() + 1) % get_child_count()
	activeCharacter = get_child(nextIndex)
	activeCharacter.get_node("Queue").visible = true
	
	if activeCharacter is Enemy:
		playTurn()

func _process(delta):
	if activeCharacter is Ally:
		if Input.is_action_just_pressed("skipTurn"):
			skipTurn()
		elif Input.is_action_just_pressed("playTurn"):
			playTurn()
