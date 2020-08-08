extends Node

#Interface for Action classes.
class_name IAction

enum actionTarget {
	NOBODY = 0,
	ENEMY = 1,
	ALLY = 2,
	SELF = 3
}

# warning-ignore:unused_class_variable
export (Texture) var icon = null
# warning-ignore:unused_class_variable
export (int, "Nobody","Enemy", "Ally", "Self") var target = "Nobody"

onready var turnQueue : TurnQueue

# warning-ignore:shadowed_variable
func _ready():
	var turnQueue = get_node("/root/Game/Battleground/TurnQueue")
	self.turnQueue = turnQueue

#Abstract method for inherited classes.
# warning-ignore:unused_argument
func execute(args := []) -> void:
	print("IAction Class -> Nothing") #Prints this message for debugging.