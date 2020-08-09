extends Node2D

signal victory
signal defeat

onready var enemies : Array = []
onready var allies : Array = []

func _ready():
	enterBattle()

func enterBattle():
	for battler in $TurnQueue.get_children():
		if battler is Enemy:
			enemies.append(battler)
		elif battler is Ally:
			allies.append(battler)
	$TurnQueue.initialize()

func _on_TurnQueue_turn_changed(activeBattler):
	print("yes")
	var node = get_node("UI/Panel/Scroll/Targets")
	for child in node.get_children():
		child.queue_free()
		#node.remove_child(child)
	if not _areTheyStillAlive(enemies):
		endBattle()
		emit_signal("victory")
	elif not _areTheyStillAlive(allies):
		endBattle()
		emit_signal("defeat")
		
func _areTheyStillAlive(teamList := []) -> bool:
	var isThereAlive : bool = false
	if teamList.empty():
		return false
	for battler in teamList:
		if battler.isAlive:
			isThereAlive = true
	return isThereAlive

func endBattle() -> void:
	print("Battle is over!")
	var node = get_node("UI/Panel/Scroll/Targets")
	var node2 = get_node("TurnQueue")
	for child in node.get_children():
		child.queue_free()

	for battler in node2.get_children():
		node2.remove_child(battler)	
