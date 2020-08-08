extends IAction

#This action is to have the battler attack to someone.
class_name Attack

#const TARGET_DISTANCE = 85
#const TWEEN_DURATION = 0.5
const ATTACK_DURATION = 0.65

#There are totally 2 parameters.
#Parameters -> attacker : Battler, target : Battler
func execute(args := []) -> void:
	#Defining attacker and victim.
	var attacker : Battler = args[0]
	var victim : Battler = args[1]
	var attackersStrength = 5
	
	#Defining their BattlerReference.
	var attackerReference = attacker.battlerReference
	var victimReference = victim.battlerReference
	
	#For debugging
	print(attacker.name, " attacked to ", victim.name)
	
	#Attacker goes to the victim.
	attackerReference.goToEntity(victim)
	yield(attackerReference.tween, "tween_completed")
	
	#Plays attacker "Attack" animation.
	attackerReference.animationPlayer.play("Attack")
	yield(attackerReference.animationPlayer, "animation_finished")
	
	#Victim takes some damage.	
	victim.takeDamage(attackersStrength)
	
	#Attacker returns to his place after attacking.
	attackerReference.returnToStart()
	yield(attackerReference.tween, "tween_completed")
	
	turnQueue.skipTurn()
