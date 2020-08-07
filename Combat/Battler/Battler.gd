extends Position2D

#Main class for battlers.
class_name Battler

#We can say BattlerReference is battler's a visual thing.
#startPosition is battler's starting position. 
onready var battlerReference #: BattlerReference
onready var startPosition : Vector2
onready var stats = $Stats

var isAlive : bool = true

#Initializes variables.
func _ready():
	startPosition = global_position
	battlerReference = get_node("BattlerReference")

#Abstract method.
func playTurn(turnQueue) -> void:
	pass
	
func takeDamage(damage : float) -> void:
	if has_node("Stats/Health"):
		var healthNode : Stat = stats.get_node("Health")
		healthNode.addModifier(-damage)
		battlerReference.animationPlayer.play("TookDamage")
		if healthNode.getTotalAmount() <= 0:
			die()

func die() -> void:
	isAlive = false
	battlerReference.animationPlayer.play("Death")
