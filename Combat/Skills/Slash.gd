extends ISkill

class_name SlashSkill

func execute(args := []):
	var attacker : Battler = args[0]
	var victim : Battler = args[1]
	
	var attackerReference : BattlerSprite = attacker.battlerSprite
	
	var attackersStrength = 100
	
	attackerReference.goToEntity(victim)
	yield(attackerReference.tween, "tween_completed")
	
	#I am going to use "Animation Player" for this.
	#Attacker hits the victim.
	yield(get_tree().create_timer(0.65), "timeout")
	
	#Victim takes some damage.
	victim.takeDamage(attackersStrength)
	
	#Attacker returns to his place after attacking.
	attackerReference.returnToStart()
	yield(attackerReference.tween, "tween_completed")
	
	turnQueue.skipTurn()
