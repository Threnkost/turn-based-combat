extends Battler

#Player's characters.
class_name Ally

func playTurn(turnQueue) -> void:
	#turnQueue.label.text = "Ally"

	#Executes "Attack" action.
	var aliveTargets := []
	
	for i in turnQueue.battleground.enemies:
		if i.isAlive:
			aliveTargets.append(i)
	
	var attackAction = battlerReference.getAction("Attack")
	attackAction.execute([self, aliveTargets[0]])
	yield(attackAction, "action_completed")
	
	#Skips this turn.
	turnQueue.skipTurn()
