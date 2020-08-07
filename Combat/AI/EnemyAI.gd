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
	var aliveTargets = []
	for i in targets:
		if i.isAlive:
			aliveTargets.append(i)
	var targetCount = aliveTargets.size()
	var target : Battler = aliveTargets[rng.randi_range(0, targetCount - 1)]
	return aliveTargets[0]#target
