extends ISkill

class_name HealSkill

func execute(args := []) -> void:
	#.execute(args)
	var target : Battler = args[0]

	var healthNode = target.stats.get_node("Health")
	var maxHealthNode = target.stats.get_node("MaxHealth")
	
	healthNode.addModifier(10)
	turnQueue.skipTurn()