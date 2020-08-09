extends Node2D

signal victory
signal defeat

onready var _enemyPoints = $SpawnPoints/EnemyParty
onready var _playerPoints = $SpawnPoints/PlayerParty

onready var enemies : Array = []
onready var allies : Array = []

func _ready():
	var playerParty = []
	var enemyParty = []
	
	for i in 3:
		var PLAYER_CHARACTER = load("res://Combat/Characters/Character1.tscn").instance()
		var ENEMY_CHARACTER = load("res://Combat/Characters/Monster1.tscn").instance()
		
		playerParty.append(PLAYER_CHARACTER)
		enemyParty.append(ENEMY_CHARACTER)
	
	initializeTeams(playerParty, enemyParty)
	enterBattle()

func initializeTeams(playerParty : Array, enemyParty : Array) -> void:
#	if playerParty.size() > 4 or enemyParty.size() > 4:
#		print("\nBattleground.gd -> Error! Each party may have 4 members only!\n")
#		assert(false)
#		return
#
	enemies.clear()
	allies.clear()
	
	enemies += enemyParty
	allies += playerParty

func enterBattle():
	if enemies.empty() or allies.empty():
		print("\nBattleground.gd -> Error! A team is completely empty.")
		print("Battleground.gd -> First, initialize teams by 'initializeTeams(Array, Array)'!\n")
		assert(false)
		return
	for allyIndex in allies.size():
		allies[allyIndex].global_position = _playerPoints.get_child(allyIndex).global_position
		$TurnQueue.add_child(allies[allyIndex])
	for enemyIndex in enemies.size():
		enemies[enemyIndex].global_position = _enemyPoints.get_child(enemyIndex).global_position
		$TurnQueue.add_child(enemies[enemyIndex])
		
	$TurnQueue.initialize()

func _on_TurnQueue_turn_changed(activeBattler):
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
