extends ISkill

class_name HealSkill

const HEALING_PARTICLES = preload("res://Particles/HealingParticle.tscn")
const PARTICLE_DURATION = 1.25

func execute(args := []) -> void:
	var target : Battler = args[0]

	var healthNode = target.stats.get_node("Health")
	var maxHealthNode = target.stats.get_node("MaxHealth")
	
	var instance = HEALING_PARTICLES.instance()
	instance.addAsChild(target, PARTICLE_DURATION)
	
	healthNode.addModifier(10)
	turnQueue.skipTurn()
