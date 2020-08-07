extends Ally

onready var maxHealth : Stat = $Stats/MaxHealth
onready var health : Stat = $Stats/Health

func _ready():
	health.addModifier(maxHealth.getTotalAmount())

#func playTurn(turnQueue) -> void:
#	.playTurn(turnQueue)

func _on_MaxHealth_statChanged(statName, newAmount):
	$HealthBar.updateMaxValue(newAmount)

func _on_Health_statChanged(statName, newAmount):
	$HealthBar.updateCurrentValue(newAmount)
