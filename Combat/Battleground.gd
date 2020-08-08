extends Node2D

onready var enemies : Array = []
onready var allies : Array = []

func _ready():
	for battler in $TurnQueue.get_children():
		if battler is Enemy:
			enemies.append(battler)
		elif battler is Ally:
			allies.append(battler)
	$TurnQueue.initialize()

func _on_TurnQueue_turn_changed(activeBattler):
	var node = get_node("UI/Panel/Scroll/Targets")
	for child in node.get_children():
		child.queue_free()
		#node.remove_child(child)