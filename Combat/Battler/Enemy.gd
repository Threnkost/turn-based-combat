extends Battler

class_name Enemy

#To manage enemy's AI.
onready var AI : EnemyAI

#Initializes enemy AI
func _ready():
	AI = EnemyAI.new().initialize()

func playTurn(turnQueue) -> void:
	#Waits a little to attack player.
	yield(get_tree().create_timer(0.35), "timeout")

	#Executes "Attack" action. [Actions/Attack]
	var attackAction = getAction("Attack")
	attackAction.execute([self, AI.getRandomTarget(turnQueue.battleground.allies)])
