extends Node

class_name EnemyAI

onready var rng : RandomNumberGenerator

#Initializes this class.
func initialize() -> EnemyAI:
	rng = RandomNumberGenerator.new()
	rng.randomize()
	
	return self

#Enemy will use this function to find his target. (Ally -> Their enemy.)
func getRandomTarget(targets : Array) -> Battler:
	var targetCount = targets.size()
	var target : Battler = targets[rng.randi_range(0, targetCount - 1)]
	return target