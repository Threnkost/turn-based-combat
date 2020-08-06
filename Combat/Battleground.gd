extends Node2D

onready var enemies : Array = []
onready var allies : Array = []

func _ready():
	$TurnQueue.initialize()
	for battler in $TurnQueue.get_children():
		if battler is Enemy:
			enemies.append(battler)
		elif battler is Ally:
			allies.append(battler)
