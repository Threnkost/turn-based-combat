extends TextureButton

onready var _args : Array
onready var _targetAction : IAction

func initialize(targetAction : IAction, args : Array):
	_targetAction = targetAction
	_args = args
	
	texture_normal = targetAction.icon
	return self

func _on_ActionButton_pressed():
	_targetAction.execute(_args)
