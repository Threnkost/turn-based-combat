extends Battler

class_name Enemy

onready var AI : EnemyAI

func playTurn(turnQueue) -> void:
	yield(get_tree().create_timer(0.35), "timeout")

	.playTurn(turnQueue)
	turnQueue.label.text = "Ally"
	
	battlerReference.attackToEntity(turnQueue.battleground.allies[0])
	yield(battlerReference.tween, "tween_completed")
	
	yield(get_tree().create_timer(1), "timeout")
	#yield(animationPlayer, "animation_finished")
	
	battlerReference.returnToStart()
	yield(battlerReference.tween, "tween_completed")
	
	turnQueue.skipTurn()
