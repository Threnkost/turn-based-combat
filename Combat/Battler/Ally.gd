extends Battler

#Player's characters.
class_name Ally

func playTurn(turnQueue) -> void:
	#turnQueue.label.text = "Ally"

	#Executes "Attack" action.
	var attackAction = battlerReference.getAction("Attack")
	attackAction.execute([self, turnQueue.battleground.enemies[0]])
	yield(attackAction, "action_completed")
	
	#Skips this turn.
	turnQueue.skipTurn()
