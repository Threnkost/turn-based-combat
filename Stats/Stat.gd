extends Node

signal statChanged(statName, newAmount)

class_name Stat

export (int) var baseAmount = 1 setget ,getBaseAmount
export (bool) var isPercent = false

onready var _modifiers : Array = []

func _ready():
	emit_signal("statChanged", name, baseAmount)

func addModifier(amount: int) -> void:
	_modifiers.append(amount)
	emit_signal("statChanged", name, getTotalAmount())
	
func removeModifier(amount: int) -> void:
	if _modifiers.has(amount):
		_modifiers.erase(amount)
	else:
		_modifiers.append(-amount)
	emit_signal("statChanged", name, getTotalAmount())

func getBaseAmount() -> float:
	if isPercent:
		return baseAmount / 100
	return baseAmount
	
func getTotalAmount() -> float:
	var totalAmount = baseAmount
	for i in _modifiers:
		totalAmount += i
	if isPercent:
		return totalAmount / 100
	return totalAmount
