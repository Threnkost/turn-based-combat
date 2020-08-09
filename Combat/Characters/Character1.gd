extends Ally

#onready var maxHealth : CharacterStat = $Stats/MaxHealth
#onready var health : CharacterStat = $Stats/Health
#
#func _ready():
#	health.amount = maxHealth.getTotalAmount()
#
##func _on_MaxHealth_statChanged(statName, newAmount):
##	$HealthBar.updateMaxValue(newAmount)
##
##func _on_Health_statChanged(statName, newAmount):
##	$HealthBar.updateCurrentValue(newAmount)
#
#func _on_MaxHealth_amountChanged(newAmount):
#	$HealthBar.updateMaxValue(newAmount)
#
#func _on_Health_amountChanged(newAmount):
#	$HealthBar.updateCurrentValue(newAmount)
