extends Node

class_name CharacterStats

func initialize() -> void:
	pass

func getAmountOfStat(statName : String) -> int:
	if has_node(statName):
		var value : int = get_node(statName).getTotalAmount()
		return value
	return 0

func addModifierToStat(statName : String, value : int) -> void:
	if has_node(statName):
		var stat : Stat = get_node(statName)
		stat.addModifier(value)
		
func removeModifierFromStat(statName : String, value : int) -> void:
	if has_node(statName):
		var stat : Stat = get_node(statName)
		stat.removeModifier(value)
