extends Node

signal statChanged(statName, newAmount)

class_name Stat

var amount : int = 0

onready var _modifiers : Array = []

func _ready():
	emit_signal("statChanged", name, amount)

func addModifier(amount: int) -> void:
	_modifiers.append(amount)
	emit_signal("statChanged", name, getTotalAmount())
	
func removeModifier(amount: int) -> void:
	if _modifiers.has(amount):
		_modifiers.erase(amount)
	else:
		_modifiers.append(-amount)
	emit_signal("statChanged", name, getTotalAmount())
	
func getTotalAmount() -> float:
	var totalAmount = amount
	for i in _modifiers:
		totalAmount += i
	return totalAmount
