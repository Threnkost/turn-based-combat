extends Control

onready var _alliesButton : Button  = $Panel/Buttons/Allies
onready var _enemiesButton : Button = $Panel/Buttons/Enemies

onready var _enemySide = $Panel/TargetEnemy/Enemies
onready var _allySide  = $Panel/TargetAlly/Allies

func addPanelToEnemySide(targetInfo) -> void:
	_enemySide.call_deferred("add_child", targetInfo)
	
func addPanelToAllySide(targetInfo) -> void:
	_allySide.call_deferred("add_child", targetInfo)

func clearEnemySide() -> void:
	for child in _enemySide.get_children():
		child.queue_free()
	
func clearAllySide() -> void:
	for child in _allySide.get_children():
		child.queue_free()
	
func clearAll() -> void:
	clearEnemySide()
	clearAllySide()


func _on_Allies_pressed():
	_enemySide.visible = false
	_allySide.visible  = true
	
#	_alliesButton.toggle_mode = true
#	_enemiesButton.toggle_mode = false

func _on_Enemies_pressed():
	_enemySide.visible = true
	_allySide.visible  = false
	
#	_alliesButton.toggle_mode = false
#	_enemiesButton.toggle_mode = true
