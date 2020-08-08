extends Panel

onready var _battler : Ally
onready var _targetBattler : Battler
onready var _turnQueue : TurnQueue

var _actions : Array = []

func initialize(turnQueue : TurnQueue, newBattler : Ally, targetBattler : Battler) -> void:
	_turnQueue = turnQueue

	_battler = newBattler
	_targetBattler = targetBattler
	
	$Target.text = _targetBattler.name
	
func addAction(action : IAction, args : Array) -> void:
	var actionButton = load("res://Combat/UI/ActionButton.tscn").instance()
	actionButton.initialize(action, args)
	#_actions.append(actionButton)
	
	$Actions.add_child(actionButton)
#	var battlerReference = _battler.battlerReference
#	var attackAction = battlerReference.getAction("Attack")
#	attackAction.execute([_battler, _targetBattler])
#	yield(attackAction, "action_completed")
#	_turnQueue.skipTurn()

func _on_TargetPanel_mouse_entered():
	_targetBattler.get_node("Indicator").visible = true

func _on_TargetPanel_mouse_exited():
	_targetBattler.get_node("Indicator").visible = false
