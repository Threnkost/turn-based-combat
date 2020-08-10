extends ISkill

class_name HealSkill

const HEALING_PARTICLES = preload("res://Particles/HealingParticle.tscn")
const PARTICLE_DURATION = 1.25

func execute(args := []) -> void:
	var target : Battler = args[0]
	var targetSprite : BattlerSprite = target.battlerSprite
	
	var particlesInstance = HEALING_PARTICLES.instance()
	particlesInstance.addAsChild(targetSprite, PARTICLE_DURATION)

	target.healthPoint += 10
	turnQueue.skipTurn()
