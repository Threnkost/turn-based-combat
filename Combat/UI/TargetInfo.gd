extends Panel

const ACTION_BUTTON = preload("res://Combat/UI/ActionButton.tscn")

onready var _actionsContainer = $ActionsScroll/Actions
onready var _targetNameLabel  = $TargetName
onready var _targetHealthBar  = $TargetHealthBar

#onready var _battler : Ally
#onready var _target : Enemy
#onready var _actions : Array

func initialize(battler : Battler, target : Battler) -> Object:
#	_battler = battler
#	_target  = target
	
	_targetNameLabel.text = target.name
	
	var healthPercent = int(target.healthPoint / target.maxHealthPoint * 100)
	_targetHealthBar.value = healthPercent

	return self

func addAction(action : IAction, parameters := []) -> void:
	var actionButton = ACTION_BUTTON.instance() #load("res://Combat/UI/ActionButton.tscn").instance()
	actionButton.initialize(action, parameters)
	
	_actionsContainer.add_child(actionButton)
