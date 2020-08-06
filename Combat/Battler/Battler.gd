extends Position2D

#Main class for battlers.
class_name Battler

#We can say BattlerReference is battler's a visual thing.
#startPosition is battler's starting position. 
onready var battlerReference #: BattlerReference
onready var startPosition : Vector2

#Initializes variables.
func _ready():
	startPosition = global_position
	battlerReference = get_node("BattlerReference")

#Abstract method.
func playTurn(turnQueue) -> void:
	pass
