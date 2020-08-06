extends Position2D

class_name Battler

onready var battlerReference #: BattlerReference
onready var startPosition : Vector2

func _ready():
	startPosition = global_position
	
	battlerReference = get_node("BattlerReference")

func playTurn(turnQueue) -> void:
	pass
