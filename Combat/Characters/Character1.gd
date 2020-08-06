extends Ally

func playTurn(turnQueue) -> void:
	.playTurn(turnQueue)
	turnQueue.label.text = "Ally"
	
	battlerReference.attackToEntity(turnQueue.battleground.enemies[0])
	yield(battlerReference.tween, "tween_completed")
	
	yield(get_tree().create_timer(1), "timeout")
	#yield(animationPlayer, "animation_finished")
	
	battlerReference.returnToStart()
	yield(battlerReference.tween, "tween_completed")
	
	turnQueue.skipTurn()
