extends Battler

#Player's characters.
class_name Ally

func playTurn(turnQueue) -> void:
#	#Executes "Attack" action.
	var aliveEnemies := []
	var aliveAllies := []

	for enemy in turnQueue.battleground.enemies:
		if enemy.isAlive:
			aliveEnemies.append(enemy)
			
	for ally in turnQueue.battleground.allies:
		if ally.isAlive:
			aliveAllies.append(ally)
			
	var targetPanel = turnQueue.battleground.get_node("UI/TargetPanel")
	var targetInfo  = load("res://Combat/UI/TargetInfo.tscn")
	var targetInfoInstance = targetInfo.instance()

#	for ally in aliveAllies:
#		var parameters = [self, ally]
#
#		for action in actions.get_children():
#			if action.target == action.actionTarget.TEAM:
#				targetInfoInstance.addAction(action, parameters)
#				targetPanel.addPanelToAllySide(targetInfoInstance)
				
	for enemy in aliveEnemies:
		var parameters = [self, enemy]
		
		for action in actions.get_children():
			if action.target == action.actionTarget.ALLY:
				targetInfoInstance = targetInfo.initialize(self, enemy)
				targetInfoInstance.addAction(action, parameters)
				targetPanel.addPanelToAllySide(targetInfoInstance)
