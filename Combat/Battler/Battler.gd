extends Position2D

#Main class for battlers.
class_name Battler

export (Resource) var characterStats

#We can say battlerSprite is battler's a visual thing.
#startPosition is battler's starting position. 
onready var startPosition : Vector2

onready var healthBar = $HealthBar
onready var battlerSprite = $BattlerSprite
onready var stats : CharacterStats = $CharacterStats
onready var actions = $Actions

var maxHealthPoint : int = 0 setget setMaxHealth
var maxManaPoint : int = 0 setget setMaxMana
var healthPoint : int = 0 setget setHealth
var manaPoint : int = 0 setget setMana

var isAlive : bool = true

#Initializes variables.
func _ready():
	startPosition = global_position

	setMaxHealth(characterStats.baseMaxHealth)
	setMaxMana(characterStats.baseMaxMana)
	
	setHealth(maxHealthPoint)
	setMana(maxManaPoint)
	
	stats.initialize(characterStats.baseStats)
	
func getAction(actionName : String):
	var path = "Actions/" + actionName
	if has_node(path):
		return get_node(path)
	return get_node("Actions/IAction")
	
func takeDamage(damage : float) -> void:
	healthPoint -= damage
	healthBar.updateCurrentValue(healthPoint)
	if healthPoint <= 0:
		_die()
	else:
		battlerSprite.animationPlayer.play("TookDamage")

func _die() -> void:
	isAlive = false
	battlerSprite.animationPlayer.play("Death")
	
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
