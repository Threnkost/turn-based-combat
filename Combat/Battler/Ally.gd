extends Battler

#Player's characters.
class_name Ally

onready var actions

func _ready():
	actions = battlerReference.get_node("Actions")

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
			
	var node = turnQueue.battleground.get_node("UI/Panel/Scroll/Targets")
	var PANEL = load("res://Combat/UI/TargetPanel.tscn")
	
	var selfInstance = PANEL.instance()
	selfInstance.initialize(turnQueue, self, self)
	for action in actions.get_children():
		if action.target == action.actionTarget.SELF:
			selfInstance.addAction(action, [self])
	node.call_deferred("add_child", selfInstance)
	
	for ally in aliveAllies:
		var ableToAdd : bool = false
		var instance = PANEL.instance()
		instance.initialize(turnQueue, self, ally)
		for action in actions.get_children():
			if action.target == action.actionTarget.ALLY:
				instance.addAction(action, [self, ally])
				ableToAdd = true
		if ableToAdd: 
			node.call_deferred("add_child", instance)
	
	for enemy in aliveEnemies:	
		var ableToAdd : bool = false
		var instance = PANEL.instance()
		instance.initialize(turnQueue, self, enemy)
		for action in actions.get_children():
			if action.target == action.actionTarget.ENEMY:
				instance.addAction(action, [self, enemy])
				ableToAdd = true
		if ableToAdd:
			node.call_deferred("add_child", instance)