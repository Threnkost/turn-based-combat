extends Position2D

#Main class for battlers.
class_name Battler

#We can say BattlerReference is battler's a visual thing.
#startPosition is battler's starting position. 
onready var battlerReference #: BattlerReference
onready var startPosition : Vector2

onready var healthBar = $HealthBar
onready var stats : CharacterStats = $CharacterStats

var maxHealthPoint : int = 0 setget setMaxHealth
var maxManaPoint : int = 0 setget setMaxMana
var healthPoint : int = 0 setget setHealth
var manaPoint : int = 0 setget setMana

var isAlive : bool = true

#Initializes variables.
func _ready():
	startPosition = global_position
	battlerReference = get_node("BattlerReference")
	
func takeDamage(damage : float) -> void:
	if has_node("Stats/Health"):
		healthPoint -= damage
		if healthPoint <= 0:
			_die()
		else:
			battlerReference.animationPlayer.play("TookDamage")

func _die() -> void:
	isAlive = false
	battlerReference.animationPlayer.play("Death")
	
func setMaxHealth(newAmount) -> void:
	maxHealthPoint = max(0, newAmount)
	healthBar.updateMaxValue(maxHealthPoint)
	
func setMaxMana(newAmount) -> void:
	maxManaPoint = max(0, newAmount)

func setHealth(newAmount) -> void:
	healthPoint = newAmount
	if healthPoint > maxHealthPoint:
		healthPoint = maxHealthPoint
	healthBar.updateCurrentValue(healthPoint)
	
func setMana(newAmount) -> void:
	manaPoint = newAmount

#Abstract method.
func playTurn(turnQueue) -> void:
	pass
