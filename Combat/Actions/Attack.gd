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
	var attackerSprite = attacker.battlerSprite
	
	#For debugging
	print(attacker.name, " attacked to ", victim.name)
	
	#Attacker goes to the victim.
	attackerSprite.goToEntity(victim)
	yield(attackerSprite.tween, "tween_completed")
	
	#Plays attacker "Attack" animation.
	attackerSprite.animationPlayer.play("Attack")
	yield(attackerSprite.animationPlayer, "animation_finished")
	
	#Victim takes some damage.	
	victim.takeDamage(attackersStrength)
	
	#Attacker returns to his place after attacking.
	attackerSprite.returnToStart()
	yield(attackerSprite.tween, "tween_completed")
	
	turnQueue.skipTurn()
