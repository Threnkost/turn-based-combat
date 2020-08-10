extends ISkill

class_name HealSkill

const HEALING_PARTICLES = preload("res://Particles/HealingParticle.tscn")
const PARTICLE_DURATION = 1.25

func execute(args := []) -> void:
	var healer : Battler = args[0]
	var target : Battler
	if self.target == self.actionTarget.SELF:
		target = healer
	elif self.target == self.actionTarget.ALLY:
		target = args[1]
	var healerSprite : BattlerSprite = healer.battlerSprite
	var targetSprite : BattlerSprite = target.battlerSprite
	
	healerSprite.animationPlayer.play("Heal")

	var particlesInstance = HEALING_PARTICLES.instance()
	particlesInstance.addAsChild(targetSprite, PARTICLE_DURATION)

	target.healthPoint += 10
	turnQueue.skipTurn()
