extends IAction

#This action is to have the battler attack to someone.
class_name Attack

const TARGET_DISTANCE = 85
const TWEEN_DURATION = 0.5
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
	
	#I am going to use "Animation Player" for this.
	#Attacker hits the victim.
	yield(get_tree().create_timer(ATTACK_DURATION), "timeout")
	
	#Victim takes some damage.
	victim.takeDamage(attackersStrength)
	
	#Attacker returns to his place after attacking.
	attackerReference.returnToStart()
	yield(attackerReference.tween, "tween_completed")
	
	#Emits signal, action_completed, to finish the action.
	emit_signal("action_completed")
